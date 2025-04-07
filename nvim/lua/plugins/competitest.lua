return {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("competitest").setup({
      -- 컴파일 명령어 커스터마이즈 (C++)
      compile_command = {
        cpp = { exec = "g++-14", args = { "-std=c++17", "-Wall", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
      },
      -- 키 매핑 설정 (옵션)
      runner_ui = {
        interface = "popup", -- 또는 "split"
        mappings = {
          run_again = "R",
          run_all_again = "<C-r>",
          kill = "K",
          kill_all = "<C-k>",
          close = { "q", "Q" },
        },
      },
    })
    -- 편리한 키 매핑 추가 (선택사항)
    vim.keymap.set("n", "<F5>", ":CompetiTest run<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<F6>", ":CompetiTest add_testcase<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<F7>", ":CompetiTest edit_testcase<CR>", { noremap = true, silent = true })
  end,
}
