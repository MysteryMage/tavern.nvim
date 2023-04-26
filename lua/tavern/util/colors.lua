local hsluv = require('tavern.util.hsluv')

local M = {}

M.bg = '#000000'
M.fg = '#ffffff'
M.day_brightness = 0.3

local hex_to_rgb = function(hex_str)
    local hex = '[abcdef0-9][abcdef0-9]'
    local pat = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
    hex_str = string.lower(hex_str)

    assert(string.find(hex_str, pat) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

    local red, green, blue = string.match(hex_str, pat)
    return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

local function rgb_to_hex(rgb)
    local hexadecimal = '#'

    for _, value in pairs(rgb) do
        local hex = ''

        while value > 0 do
            local index = math.fmod(value, 16) + 1
            value = math.floor(value / 16)
            hex = string.sub(hsluv.hexChars, index, index) .. hex
        end

        if string.len(hex) == 0 then
            hex = '00'
        elseif string.len(hex) == 1 then
            hex = '0' .. hex
        end

        hexadecimal = hexadecimal .. hex
    end

    return hexadecimal
end

---@param fg string forecrust color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(fg, bg, alpha)
    local res_bg = hex_to_rgb(bg)
    local res_fg = hex_to_rgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * res_fg[i] + ((1 - alpha) * res_bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format('#%02X%02X%02X', blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
    return M.blend(hex, bg or M.bg, math.abs(1 - amount))
end

function M.lighten(hex, amount, fg)
    return M.blend(hex, fg or M.fg, math.abs(1 - amount))
end

function M.invert_color(color)
    if color ~= 'NONE' then
        local hsl = hsluv.hex_to_hsluv(color)
        hsl[3] = 100 - hsl[3]
        if hsl[3] < 40 then
            hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
        end
        return hsluv.hsluv_to_hex(hsl)
    end

    return color
end

function M.saturate(hex, percentage)
    local rgb = hex_to_rgb(hex)

    local saturation_float = percentage

    table.sort(rgb)
    local rgb_intensity = {
        min = rgb[1] / 255,
        mid = rgb[2] / 255,
        max = rgb[3] / 255,
    }

    if rgb_intensity.max == rgb_intensity.min then
        -- all colors have same intensity, which means
        -- the original color is gray, so we can't change saturation.
        return hex
    end

    local new_intensities = {}
    new_intensities.max = rgb_intensity.max
    new_intensities.min = rgb_intensity.max * (1 - saturation_float)

    if rgb_intensity.mid == rgb_intensity.min then
        new_intensities.mid = new_intensities.min
    else
        local intensity_proportion = (rgb_intensity.max - rgb_intensity.mid) / (rgb_intensity.mid - rgb_intensity.min)
        new_intensities.mid = (intensity_proportion * new_intensities.min + rgb_intensity.max)
            / (intensity_proportion + 1)
    end

    for i, v in pairs(new_intensities) do
        new_intensities[i] = math.floor(v * 255)
    end

    table.sort(new_intensities)

    return (rgb_to_hex({ new_intensities.max, new_intensities.min, new_intensities.mid }))
end

function M.desaturate(hex, percentage)
    local rgb = hex_to_rgb(hex)

    local grey_intesity = (rgb[1] + rgb[2] + rgb[3]) / 3
    local saturation_float = percentage

    local deviations = { grey_intesity - rgb[1], grey_intesity - rgb[2], grey_intesity - rgb[3] }
    local new_rgb = {
        rgb[1] + deviations[1] * saturation_float,
        rgb[2] + deviations[2] * saturation_float,
        rgb[3] + deviations[3] * saturation_float,
    }

    return (rgb_to_hex(new_rgb))
end

return M
