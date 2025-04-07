return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      -- 기존 설정 유지
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      -- Prettier 설정 추가
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      rust = { "prettier" },
      java = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
    },
  },
}
