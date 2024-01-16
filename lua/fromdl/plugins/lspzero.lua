return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		dependencies = {
			"hrsh7th/cmp-path",
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "j-hui/fidget.nvim",   opts = {} },
		},
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
	},
	"hrsh7th/cmp-nvim-lsp-signature-help",
}
