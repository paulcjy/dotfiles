local M = {}

-- 백준 문제 설정
local config = {
  base_dir = "",
  template_file = "",
  problem_dir = "",
  sample_script = "",
}

-- 문제 번호로 새 문제 설정
function M.setup_problem(problem_num)
  if not problem_num or problem_num == "" then
    -- 인자가 없으면 입력 요청
    problem_num = vim.fn.input("문제 번호: ")
    if problem_num == "" then
      print("문제 번호가 필요합니다.")
      return
    end
  end

  -- 문제 디렉토리 및 파일 경로
  local template_path = vim.fs.joinpath(config.base_dir, config.template_file)
  local problem_dir = vim.fs.joinpath(config.base_dir, config.problem_dir, problem_num)
  local target_path = vim.fs.joinpath(problem_dir, problem_num .. ".cpp")

  -- 디렉토리 생성
  vim.fn.mkdir(problem_dir, "p")

  -- 템플릿 파일 복사
  if vim.fn.filereadable(template_path) == 1 then
    vim.fn.system("cp " .. template_path .. " " .. target_path)
    print("템플릿 파일을 " .. target_path .. "로 복사했습니다.")
  else
    print("오류: 템플릿 파일 " .. template_path .. "을 찾을 수 없습니다.")
    return
  end

  -- 백준 문제 URL
  local problem_url = "https://www.acmicpc.net/problem/" .. problem_num

  -- 문제 내용 다운로드
  print("문제 " .. problem_num .. "의 HTML을 다운로드합니다...")
  local curl_cmd = "curl -s -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36' "
    .. problem_url
  local html_content = vim.fn.system(curl_cmd)

  if html_content == "" then
    print("오류: HTML 내용을 가져올 수 없습니다.")
    return
  end

  -- 샘플 입출력 추출 스크립트 실행
  local sample_script = vim.fs.joinpath(config.base_dir, config.sample_script)

  if vim.fn.filereadable(sample_script) == 1 then
    print("샘플 입출력을 추출합니다...")

    -- 스크립트 실행 권한 확인 및 부여
    vim.fn.system("chmod +x " .. sample_script)

    -- 스크립트 실행
    local cmd = sample_script .. " " .. problem_num .. " " .. problem_dir
    local result = vim.fn.system(cmd)

    -- 결과 출력
    print(result)

    local exit_code = vim.v.shell_error
    if exit_code ~= 0 then
      if exit_code == 2 then
        print("경고: 샘플 입력과 출력을 찾을 수 없습니다.")
      else
        print("오류: 샘플 추출 스크립트 실행 중 문제가 발생했습니다.")
      end
    end
  else
    print("오류: 샘플 추출 스크립트 " .. sample_script .. "을 찾을 수 없습니다.")
  end

  print("작업 완료! " .. problem_dir .. " 디렉토리에 파일이 생성되었습니다.")

  -- 새로 생성한 CPP 파일 열기
  vim.cmd("edit " .. target_path)
end

-- 설정 함수
function M.setup(opts)
  config = vim.tbl_deep_extend("force", config, opts or {})
end

-- 문제 디렉토 변경 함수
function M.set_problem_dir()
  local current = config.problem_dir
  print("현재 문제 폴더: " .. (current ~= "" and current or "(없음)"))
  local input =
    vim.fn.input("변경할 문제 디렉토리 (기존: " .. (current ~= "" and current or "[없음]") .. ")")

  config.problem_dir = input
  print("문제 디렉토리가 '" .. input .. "'로 변경되었습니다.")
end

-- 현재 설정 보기
function M.show_config()
  print("BOJ Config")
  print("- base dir: " .. config.base_dir)
  print("- template file: " .. config.template_file)
  print("- problem dir: " .. config.problem_dir)
end

return M
