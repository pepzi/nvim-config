local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	--  'wbthomason/packer.nvim',
	-- theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	},
	-- file explorer tree
	"nvim-tree/nvim-tree.lua",
	-- filesystem editor
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<space>-", require("oil").toggle_float)
		end,
	},
	-- icons
	"nvim-tree/nvim-web-devicons",
	-- statusline
	"nvim-lualine/lualine.nvim",
	-- "parsing library"
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-textobjects",
	-- display possible keybindings
	"folke/which-key.nvim",
	-- lots of things
	"echasnovski/mini.nvim",
	"tpope/vim-surround",
	-- modern database interface
	"tpope/vim-dadbod",
	-- database completion
	"kristijanhusak/vim-dadbod-completion",
	-- database ui
	"kristijanhusak/vim-dadbod-ui",
	-- git wrapper
	"tpope/vim-fugitive",
	-- comment out stuff
	"tpope/vim-commentary",
	{
		-- autopars
		"windwp/nvim-autopairs",
		-- ! completion plugin
		dependencies = { { "hrsh7th/nvim-cmp" } },
		config = function()
			require("nvim-autopairs").setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	"onsails/lspkind.nvim",

	-- formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					php = { "pretty-php" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	-- debugging
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			-- debugging ui
			"theHamsta/nvim-dap-virtual-text",
			"williamboman/mason.nvim",
			-- library for asynchronous io
			"nvim-neotest/nvim-nio",
		},
	},
	{
		-- tree-sitter parser for rust
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
		opts = {
			server = {
				on_attach = function(_, bufnr)
					local wk = require("which-key")
					wk.register({
						["<leader>ca"] = {
							function()
								vim.cmd.RustLsp("codeAction")
							end,
							"[C]ode [A]ction",
						},
						["<leader>dr"] = {
							function()
								vim.cmd.RustLsp("debuggables")
							end,
							"Rust debuggables",
						},
					}, { mode = "n", buffer = bufnr })
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							runBuildScripts = true,
						},
						-- Add clippy lints for Rust.
						checkOnSave = {
							allFeatures = true,
							command = "clippy",
							extraArgs = { "--no-deps" },
						},
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts or {})
		end,
	},
	{
		-- code diagnostics, references etc
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- add any options here
		},
		keys = {
			{
				"<S-Enter>",
				function()
					require("noice").redirect(vim.fn.getcmdline())
				end,
				mode = "c",
				desc = "Redirect Cmdline",
			},
			{
				"<leader>snl",
				function()
					require("noice").cmd("last")
				end,
				desc = "Noice Last Message",
			},
			{
				"<leader>snh",
				function()
					require("noice").cmd("history")
				end,
				desc = "Noice History",
			},
			{
				"<leader>sna",
				function()
					require("noice").cmd("all")
				end,
				desc = "Noice All",
			},
			-- Doesn't work for me, infinite loop of Notify messages
			-- {
			-- 	"<leader>snd",
			-- 	function()
			-- 		require("noice").cmd("dismiss")
			-- 	end,
			-- 	desc = "Dismiss All",
			-- },
			{
				"<c-f>",
				function()
					if not require("noice.lsp").scroll(4) then
						return "<c-f>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll forward",
				mode = { "i", "n", "s" },
			},
			{
				"<c-b>",
				function()
					if not require("noice.lsp").scroll(-4) then
						return "<c-b>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll backward",
				mode = { "i", "n", "s" },
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		-- git ui
		"NeogitOrg/neogit",
		dependencies = {
			-- module for asynchronous programming using coroutines
			"nvim-lua/plenary.nvim", -- required
			-- show diffs
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	-- completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	-- snippets
	"L3MON4D3/LuaSnip",
	-- luasnip completion
	"saadparwaiz1/cmp_luasnip",
	-- preconfigured snippets for a set of different programming languages
	"rafamadriz/friendly-snippets",
	-- package manager for lsp/dap servers, linters, formatters
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"mrded/nvim-lsp-notify",
		dependencies = { { "rcarriga/nvim-notify" } },
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			require("lsp-notify").setup({
				notify = require("notify"),
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		-- fuzzy finder over lists
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- fuzzy finder for projects
	"nvim-telescope/telescope-project.nvim",
	-- lets user use telescopes ui in more places outside of :Telescope commands
	"nvim-telescope/telescope-ui-select.nvim",
	{
		-- fuzzy finder file browser
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		-- ai code completion
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	-- {
	-- 	-- note taking
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*",
	-- 	lazy = true,
	-- 	event = {
	-- 		"BufReadPre " .. vim.fn.expand("~") .. "/obsidian-vault/**.md",
	-- 		"BufNewFile " .. vim.fn.expand("~") .. "/obsidian-vault/**.md",
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- },
	{
		"tzachar/highlight-undo.nvim",
		event = "VeryLazy",
		opts = {
			hlgroup = "CurSearch",
			duration = 150,
			keymaps = {
				{ "n", "u", "undo", {} }, -- If you remap undo/redo, change this
				{ "n", "<C-r>", "redo", {} },
			},
		},
		config = function(_, opts)
			require("highlight-undo").setup(opts)

			-- Also flash on yank.
			vim.api.nvim_create_autocmd("TextYankPost", {
				desc = "Highlight yanked text",
				pattern = "*",
				callback = function()
					vim.highlight.on_yank()
				end,
			})
		end,
	},
	"nvimdev/lspsaga.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
