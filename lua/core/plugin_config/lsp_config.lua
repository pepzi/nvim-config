require("mason").setup()
require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
	["rust_analyzer"] = function() end,
})

require("lspconfig").ruff_lsp.setup({
	init_options = {
		settings = {
			-- Any extra CLI arguments for `ruff` go here.
			args = {},
		},
	},
})
require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

local api = vim.api

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- Attach plugins
		-- require('nvim-navic').attach(client, bufnr)

		vim.cmd.setlocal("signcolumn=yes")
		vim.bo[bufnr].bufhidden = "hide"

		-- Enable completion triggered by <c-x><c-o>
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
		local function desc(description)
			return { noremap = true, silent = true, buffer = bufnr, desc = description }
		end
		-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
		vim.keymap.set("n", "ö", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "ä", vim.diagnostic.goto_next)
		-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

		vim.keymap.set("n", "<space>lgr", require("telescope.builtin").lsp_references, desc("lsp telescope grep"))
		vim.keymap.set("n", "<space>lgD", vim.lsp.buf.declaration, desc("lsp [g]o to [D]eclaration"))
		vim.keymap.set("n", "<space>lgd", vim.lsp.buf.definition, desc("lsp [g]o to [d]efinition"))
		vim.keymap.set("n", "<space>lgt", vim.lsp.buf.type_definition, desc("lsp [g]o to [t]ype definition"))
		vim.keymap.set("n", "K", vim.lsp.buf.hover, desc("[lsp] hover"))
		-- vim.keymap.set('n', '<space>lpd', peek_definition, desc('lsp [p]eek [d]efinition'))
		-- vim.keymap.set('n', '<space>lpt', peek_type_definition, desc('lsp [p]eek [t]ype definition'))
		vim.keymap.set("n", "<space>lgi", vim.lsp.buf.implementation, desc("lsp [g]o to [i]mplementation"))
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, desc('[lsp] signature help'))
		vim.keymap.set("n", "<space>lWa", vim.lsp.buf.add_workspace_folder, desc("lsp add [w]orksp[a]ce folder"))
		vim.keymap.set("n", "<space>lWr", vim.lsp.buf.remove_workspace_folder, desc("lsp [w]orkspace folder [r]emove"))
		vim.keymap.set("n", "<space>lWl", function()
			vim.print(vim.lsp.buf.list_workspace_folders())
		end, desc("[lsp] [w]orkspace folders [l]ist"))
		-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, desc('lsp [r]e[n]ame'))
		vim.keymap.set("n", "<space>lWq", vim.lsp.buf.workspace_symbol, desc("lsp [w]orkspace symbol [q]"))
		vim.keymap.set("n", "<space>lu", vim.lsp.buf.document_symbol, desc("lsp doc[u]ment symbol"))
		vim.keymap.set("n", "<M-CR>", vim.lsp.buf.code_action, desc("[lsp] code action"))
		vim.keymap.set("n", "<M-l>", vim.lsp.codelens.run, desc("[lsp] run code lens"))
		-- vim.keymap.set('n', '<space>cr', vim.lsp.codelens.refresh, desc('lsp [c]ode lenses [r]efresh'))
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, desc('lsp [g]et [r]eferences'))
		-- vim.keymap.set('n', '<space>f', function()
		--   vim.lsp.buf.format { async = true }
		-- end, desc('[lsp] [f]ormat buffer'))
		if client.server_capabilities.inlayHintProvider then
			vim.keymap.set("n", "<space>lh", function()
				local current_setting = vim.lsp.inlay_hint.is_enabled(bufnr)
				vim.lsp.inlay_hint.enable(bufnr, not current_setting)
			end, desc("[lsp] toggle inlay hints"))
		end

		-- Auto-refresh code lenses
		if not client then
			return
		end
		local function buf_refresh_codeLens()
			vim.schedule(function()
				if client.server_capabilities.codeLensProvider then
					vim.lsp.codelens.refresh()
					return
				end
			end)
		end
		local group = api.nvim_create_augroup(string.format("lsp-%s-%s", bufnr, client.id), {})
		if client.server_capabilities.codeLensProvider then
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "TextChanged" }, {
				group = group,
				callback = buf_refresh_codeLens,
				buffer = bufnr,
			})
			buf_refresh_codeLens()
		end
	end,
})
