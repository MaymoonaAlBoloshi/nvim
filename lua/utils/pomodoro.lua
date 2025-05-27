local M = {
  running = false,
  type = "Work",
  timer = nil,
  left = 25 * 60,
  done = 0,
  config = {
    work = 25,
    break_time = 5,
    goal = 3,
    message = "Focus time",
  },
}

local config_path = vim.fn.stdpath("data") .. "/pomodoro.json"

local function save_config()
  local ok, json = pcall(vim.fn.json_encode, M.config)
  if ok then vim.fn.writefile({ json }, config_path) end
end

local function load_config()
  if vim.fn.filereadable(config_path) == 1 then
    local data = vim.fn.readfile(config_path)[1]
    local ok, parsed = pcall(vim.fn.json_decode, data)
    if ok and type(parsed) == "table" then
      for k, v in pairs(parsed) do M.config[k] = v end
    end
  end
end

local function switch()
  if M.type == "Work" then
    M.done = M.done + 1
    if M.done >= M.config.goal then
      vim.notify("All sessions complete.")
      M.running = false
      return
    end
    M.type = "Break"
    M.left = M.config.break_time * 60
    vim.notify("Break time.")
  else
    M.type = "Work"
    M.left = M.config.work * 60
    vim.notify(M.config.message)
  end
end

function M.start()
  if M.running then return end
  M.running = true
  M.timer = vim.fn.timer_start(1000, function()
    if M.left > 0 then
      M.left = M.left - 1
    else
      M.running = false
      switch()
      if M.running then M.start() end
    end
  end, { ["repeat"] = -1 })
  vim.notify("Started: " .. M.type)
end

function M.stop()
  if M.timer then
    vim.fn.timer_stop(M.timer)
    M.timer = nil
  end
  M.running = false
  vim.notify("Stopped.")
end

function M.reset()
  M.stop()
  M.type = "Work"
  M.left = M.config.work * 60
  M.done = 0
  vim.notify("Reset.")
end

function M.configure()
  vim.ui.input({ prompt = "Work (min):", default = tostring(M.config.work) }, function(work)
    if not work then return end
    vim.ui.input({ prompt = "Break (min):", default = tostring(M.config.break_time) }, function(break_time)
      if not break_time then return end
      vim.ui.input({ prompt = "Message:", default = M.config.message }, function(msg)
        if not msg then return end
        vim.ui.input({ prompt = "Goal sessions:", default = tostring(M.config.goal) }, function(goal)
          M.config.work = tonumber(work)
          M.config.break_time = tonumber(break_time)
          M.config.message = msg
          M.config.goal = tonumber(goal)
          save_config()
          M.reset()
          vim.notify("Config updated.")
        end)
      end)
    end)
  end)
end

function M.status()
  local min = math.floor(M.left / 60)
  local sec = M.left % 60
  local label = M.type == "Work" and M.config.message or "Break"
  return string.format("⏱ %s %02d:%02d (%d/%d)", label, min, sec, M.done, M.config.goal)
end

-- Command registration
vim.api.nvim_create_user_command("PomodoroStart", function() M.start() end, {})
vim.api.nvim_create_user_command("PomodoroStop", function() M.stop() end, {})
vim.api.nvim_create_user_command("PomodoroReset", function() M.reset() end, {})
vim.api.nvim_create_user_command("PomodoroConfigure", function() M.configure() end, {})
vim.api.nvim_create_user_command("PomodoroStatus", function()
  vim.notify(M.status())
end, {})

load_config()

return M
