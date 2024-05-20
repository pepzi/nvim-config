require("core.plugin_config.mini")
require("core.plugin_config.colorscheme")
require("core.plugin_config.completions")
require("core.plugin_config.lsp_config")
require("core.plugin_config.lualine")
require("core.plugin_config.nvim-tree")
require("core.plugin_config.telescope")
require("core.plugin_config.treesitter")
require("core.plugin_config.which-key")
require("core.plugin_config.dap_config")
require("core.plugin_config.codeium")
-- require("core.plugin_config.noice")
require("core.plugin_config.mason")
-- require("core.plugin_config.obsidian")
require("core.plugin_config.general")

local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})
