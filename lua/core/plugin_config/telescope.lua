local builtin = require("telescope.builtin")
require("telescope").load_extension("notify")

require("telescope").load_extension("projects")

--require('telescope').extensions.notify.notify(opts)

require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
		projects = {
			base_dirs = {
				{ path = "/home/robert/dev/rust/irk" },
				{ path = "/home/robert/dev/rust/hello" },
			},
			hidden_files = true,
			theme = "dropdown",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true,
		},
	},
})
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
--require('telescope').load_extension('project')

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = '[R]ecent Files ("." for repeat)' })
vim.api.nvim_set_keymap(
	"n",
	"<leader>pp",
	-- ":lua require'telescope'.extensions.project.project{}<CR>",
	":lua require'telescope'.extensions.projects.projects{}<CR>",

	{ desc = "[P]roject [P]icker", noremap = true, silent = true }
)
