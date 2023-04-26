local M = {}

local theme = require('tavern.theme')

function M.setup()
    require('tavern.util.highlighter').apply_theme(theme.get_theme())

    if vim.g.tavern_transparent == true then
        vim.api.nvim_set_hl(0, 'Normal', {})
    end
end

return M
