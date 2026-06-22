-- Snacks.nvim — picker, dashboard, terminal, indent, etc.
local is_embedded = _G.Utils and _G.Utils.is_embedded or vim.g.vscode ~= nil

-- Cursor/VS Code: keep snacks on the whitelist but disable all UI modules.
-- LazyVim's vscode extra does this too; we repeat it so later opts merges don't re-enable features.
if is_embedded then
  return {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      picker = { enabled = false },
      profiler = { enabled = false },
      quickfile = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  }
end

local uv = vim.uv or vim.loop
local uname = uv.os_uname()
local is_win = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
local is_wsl = vim.fn.has("wsl") == 1 or (uname.release and uname.release:match("Microsoft"))

local default_shell = vim.env.SHELL or vim.fn.expand("$SHELL") or vim.o.shell

---@class snacks.indent.Config
local opts = {
  indent = {
    enabled = true,
    chunk = {
      enabled = true,
      only_current = false,
      hl = "SnacksIndentChunk",
      char = {
        corner_top = "┌",
        corner_bottom = "└",
        horizontal = "─",
        vertical = "│",
        arrow = "─",
      },
    },
  },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  words = { enabled = true },
  scroll = { enabled = false },
  profiler = { enabled = false },
  terminal = {
    win = {
      wo = { winbar = "" },
    },
  },
  image = {
    enabled = true,
    doc = { inline = false },
  },
  picker = {
    ignored = true,
    exclude = { ".git/**", "node_modules/**", "dist/**", "drizzle/**", "migrations/**" },
    layout = {
      layout = {
        box = "horizontal",
        border = "none",
        width = 0.8,
        min_width = 120,
        height = 0.8,
        {
          box = "vertical",
          border = "single",
          title = "{title} {live} {flags}",
          { win = "input", height = 1, border = "single" },
          { win = "list", border = "none" },
        },
        { win = "preview", title = "{preview}", border = "single", width = 0.6 },
      },
    },
  },
  dashboard = {
    width = 60,
    row = nil,
    col = nil,
    pane_gap = 4,
    autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
    preset = {
      pick = nil,
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = "", key = "x", desc = "Lazy Extras", action = "<cmd>LazyExtras<cr>" },
        {
          icon = " ",
          key = "c",
          desc = "Config",
          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
        },
        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
      header = [[
   
           ___  __        _  ___  __           _  ___ 
  /\  |\ |  |  (_  |_|   |_)  |  (_  |_| |\ | / \  |  
 /--\ | \| _|_ __) | |   |_) _|_ __) | | | \| \_/ _|_ 
                                                       

                                                      

    ]],
    },
    sections = {
      { section = "header" },
      {
        pane = 2,
        section = "terminal",
        cmd = (is_win and not is_wsl) and "Get-Date" or default_shell,
        height = 3,
        padding = 2,
      },
      { section = "keys", gap = 1, padding = 1 },
      { pane = 2, icon = "", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      {
        pane = 2,
        icon = " ",
        title = "Git Status",
        section = "terminal",
        enabled = vim.fn.isdirectory(".git") == 1,
        cmd = "git status --short --branch --renames",
        height = 5,
        padding = 1,
        ttl = 5 * 60,
        indent = 3,
      },
      { section = "startup" },
    },
  },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  statuscolumn = { enabled = true },
  styles = {
    notification = {
      border = "single",
      wo = { wrap = false },
    },
    notification_history = {
      border = "single",
    },
    input = {
      backdrop = false,
      position = "float",
      border = "single",
      height = 1,
      width = 40,
      relative = "cursor",
      row = -3,
      col = 1,
      b = { completion = false },
    },
  },
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  event = "VimEnter",
  opts = opts,
}
