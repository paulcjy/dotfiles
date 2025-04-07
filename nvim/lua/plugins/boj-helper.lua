return {
  dir = "~/.config/nvim/lua/boj-helper", -- 로컬 플러그인 경로
  config = function()
    require("boj-helper").setup({
      template_file = "./cpp-template.cpp",
      base_dir = vim.fn.expand("~/dev/ps/"),
      sample_script = "./boj",
    })
  end,
  keys = {
    {
      "<leader>pp",
      function()
        require("boj-helper").setup_problem()
      end,
      desc = "BOJ 문제 설정",
    },
    {
      "<leader>pc",
      function()
        require("boj-helper").show_config()
      end,
      desc = "BOJ 설정 확인",
    },
    {
      "<leader>pd",
      function()
        require("boj-helper").set_problem_dir()
      end,
      desc = "BOJ 문제 디렉토리 변경",
    },
  },
  cmd = { "Boj", "BojShowConfig", "BojSetProblemDir" },
}
