-- Main harpoon configuration with custom status UI
if _G.Utils and _G.Utils.is_embedded then return {} end

local status_timer
local status_window

local uiInfoHighlightGroup = "HarpoonFilesPanelHL"
local selected_option_hl = "HarpoonSelectedOptionHL"
local option_hl = "HarpoonOptionHL"

local disappear_delay = 1200

local function close_status_window()
  if status_window and vim.api.nvim_win_is_valid(status_window) then
    vim.api.nvim_win_close(status_window, true)
  end
  status_window = nil
  status_timer = nil
end

local function get_harpooned_files()
  local harpoon = require("harpoon")
  local file_list = {}

  for _, item in ipairs(harpoon:list().items) do
    table.insert(file_list, " " .. item.value)
  end

  return file_list
end

local function get_current_index()
  local current_file = vim.fn.bufname()

  for index, item in ipairs(require("harpoon"):list().items) do
    if item.value == current_file then
      return index
    end
  end
end

local function show_status_ui()
  local buf = vim.api.nvim_create_buf(false, true)

  local content = get_harpooned_files()

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)

  local current_index = get_current_index()

  for idx, _ in ipairs(content) do
    if idx == current_index then
      vim.api.nvim_buf_add_highlight(buf, -1, selected_option_hl, idx - 1, 0, -1)
    end
  end

  local height = math.max(1, math.min(#content, vim.o.lines - 3))

  local width = 0
  for _, line in pairs(content) do
    width = math.max(width, #line)
  end
  width = math.min(width + 2, vim.o.columns - 2)
  local row = vim.o.lines - height

  local opts = {
    relative = "win",
    anchor = "SE",
    col = vim.o.columns,
    row = row,
    width = width,
    height = height,
    focusable = false,
    style = "minimal",
  }

  status_window = vim.api.nvim_open_win(buf, false, opts)
  -- Fixed: nvim_win_set_option is deprecated → use nvim_set_option_value
  vim.api.nvim_set_option_value("winhighlight", "Normal:" .. uiInfoHighlightGroup, { win = status_window })
end

local function custom_harpoon_select(target)
  require("harpoon"):list():select(target)

  if status_timer then
    vim.fn.timer_stop(status_timer)
    close_status_window()
  end

  show_status_ui()
  status_timer = vim.fn.timer_start(disappear_delay, close_status_window)
end

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Fixed: 'requires' (Packer) → 'dependencies' (Lazy)
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "s7", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
    vim.keymap.set("n", "s8", function() harpoon:list():remove() end, { desc = "Harpoon: Remove file" })
    vim.keymap.set("n", "s9", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Quick menu" })

    vim.keymap.set("n", "su", function() custom_harpoon_select(1) end, { desc = "Harpoon: Select 1" })
    vim.keymap.set("n", "si", function() custom_harpoon_select(2) end, { desc = "Harpoon: Select 2" })
    vim.keymap.set("n", "so", function() custom_harpoon_select(3) end, { desc = "Harpoon: Select 3" })
    vim.keymap.set("n", "sp", function() custom_harpoon_select(4) end, { desc = "Harpoon: Select 4" })
    vim.keymap.set("n", "s[", function() custom_harpoon_select(5) end, { desc = "Harpoon: Select 5" })
    vim.keymap.set("n", "s]", function() custom_harpoon_select(6) end, { desc = "Harpoon: Select 6" })
  end,
}