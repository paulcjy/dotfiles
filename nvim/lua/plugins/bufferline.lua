return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bb", "<cmd>BufferLinePick<CR>", desc = "Pick Buffer by Key" },
    { "<leader>bc", "<cmd>BufferLinePickClose<CR>", desc = "Close Buffer by Key" },
  },
  opts = {
    options = {
      always_show_bufferline = true,
      pick = {
        alphabet = "1234567890qwertyuiop",
      },
      offset = {},
    },
  },
}
