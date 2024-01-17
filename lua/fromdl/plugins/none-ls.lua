return {
	{
		"MunifTanjim/prettier.nvim",
		config = function()
			local prettier = require("prettier")
			prettier.setup({
				["null-ls"] = {
					condition = function()
						return prettier.config_exists({
							-- if `false`, skips checking `package.json` for `"prettier"` key
							check_package_json = true,
						})
					end,
					runtime_condition = function(params)
						-- return false to skip running prettier
						return true
					end,
					timeout = 5000,
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
			local event = "BufWritePre" -- or "BufWritePost"
			local async = event == "BufWritePost"
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					--null_ls.builtins.formatting.prettier,
				},
				-- you can reuse a shared lspconfig on_attach callback here
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.keymap.set("n", "<Leader>f", function()
							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
						end, { buffer = bufnr, desc = "[lsp] format" })

						-- format on save
						vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
						vim.api.nvim_create_autocmd(event, {
							buffer = bufnr,
							group = group,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr, async = async })
							end,
							desc = "[lsp] format on save",
						})
					end

					if client.supports_method("textDocument/rangeFormatting") then
						vim.keymap.set("x", "<Leader>f", function()
							vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
						end, { buffer = bufnr, desc = "[lsp] format" })
					end
				end,
			})
		end,
	},
}
