vim.keymap.set("n", "<C-e>", ":Ex<CR>")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- save w/ and w/o formatting
vim.keymap.set("n", "<leader>ww", function()
	vim.cmd("w")
end)

vim.keymap.set("n", "<leader>wW", function()
	vim.cmd("noa w")
end)
