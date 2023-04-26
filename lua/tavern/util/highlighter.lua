local M = {}

function M.highlight(group, color)
	if color.style then
		for _, style in ipairs(color.style) do
			color[style] = true
		end
	end

	color.style = nil
	vim.api.nvim_set_hl(0, group, color)
end

function M.apply_theme(theme)
	for group, colors in pairs(theme) do
		M.highlight(group, colors)
	end
end

return M
