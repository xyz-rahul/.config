return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for conciseness

		local on_attach = function(client, bufnr)
			-- set keybinds
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>") -- show definition, references
			keymap.set("n", "gD", vim.lsp.buf.declaration) -- go to declaration
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>") -- show lsp definitions
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>") -- show lsp implementations
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>") -- show lsp type definitions
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action) -- see available code actions, in visual mode will apply to selection
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename) -- smart rename
			keymap.set("n", "<space>D", vim.lsp.buf.type_definition)

			keymap.set("n", "<space>dd", vim.diagnostic.open_float)
			keymap.set("n", "<space>de", vim.diagnostic.open_float)
			keymap.set("n", "[d", vim.diagnostic.goto_prev)
			keymap.set("n", "]d", vim.diagnostic.goto_next)
			keymap.set("n", "<space>dl", vim.diagnostic.setloclist)
			keymap.set("n", "K", vim.lsp.buf.hover) -- show documentation for what is under cursor
			keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure svelte server
		-- lspconfig["svelte"].setup({
		--   capabilities = capabilities,
		--   on_attach = function(client, bufnr)
		--     on_attach(client, bufnr)
		--
		--     vim.api.nvim_create_autocmd("BufWritePost", {
		--       pattern = { "*.js", "*.ts" },
		--       callback = function(ctx)
		--         if client.name == "svelte" then
		--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		--         end
		--       end,
		--     })
		--   end,
		-- })

		-- configure prisma orm server
		-- lspconfig["prismals"].setup({
		--   capabilities = capabilities,
		--   on_attach = on_attach,
		-- })

		-- configure graphql language server
		-- lspconfig["graphql"].setup({
		--   capabilities = capabilities,
		--   on_attach = on_attach,
		--   filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		-- })

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
