return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "[b", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev Buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
		{ "[B", "<cmd>BufferLineMovePrev<CR>", desc = "Move Buffer to Prev" },
		{ "]B", "<cmd>BufferLineMoveNext<CR>", desc = "Move Buffer to Next" },
		{ "<leader>bb", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer by Key" },
		{ "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Close Buffer by Key" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		{ "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
	},
	opts = {
		options = {
			always_show_bufferline = true,
			pick = {
				alphabet = "1234567890qwertyuiop",
			},
			get_element_icon = function(element)
				local icon, hl = require("mini.icons").get("filetype", element.filetype)
				return icon, hl
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
