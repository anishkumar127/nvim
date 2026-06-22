-- Blink.cmp — fast completion engine
-- VS Code/Antigravity/Cursor/Windsurf have their own completion
if _G.Utils and _G.Utils.is_embedded then return {} end

return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- Rust fuzzy matcher for best performance
    fuzzy = {
      -- Rust binary download can fail on Windows; use Lua matcher without startup warning
      implementation = "lua",
    },
    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      trigger = {
        show_on_keyword = true,
        show_on_trigger_character = true,
        show_on_insert_on_trigger_character = true,
      },
      menu = {
        border = "single",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", gap = 1 },
            { "label", gap = 10 },
            { "kind" },
            { "label_description" },
          },
          gap = 1,
        },
      },
      list = {
        -- Reduced from 100 to 50 — 100 causes noticeable lag on large projects
        max_items = 50,
        selection = { preselect = false, auto_insert = false },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "single",
          max_width = math.floor(vim.o.columns * 0.4),
          max_height = math.floor(vim.o.lines * 0.5),
        },
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = true,
        show_with_menu = true,
        show_without_menu = false,
      },
    },
    signature = { enabled = false, window = { border = "single" } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          name = "LSP",
          score_offset = 100,
          min_keyword_length = 0,
        },
        snippets = {
          name = "Snippets",
          score_offset = 90,
        },
        buffer = {
          name = "Buffer",
          score_offset = 0,
        },
      },
    },
    cmdline = {
      enabled = true,
      ---@diagnostic disable-next-line: assign-type-mismatch
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      completion = {
        menu = {
          auto_show = true,
          draw = {
            columns = { { "kind_icon", "label", "label_description", gap = 1 } },
          },
        },
      },
    },
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = {
        Text = "󰉿",
        Method = "",
        Function = "󰊕",
        Constructor = "󰒓",
        Field = "",
        Variable = "󰆦",
        Property = "󰖷",
        Class = "",
        Interface = "",
        Struct = "󱡠",
        Module = "󰅩",
        Unit = "󰪚",
        Value = "󰫧",
        Enum = "",
        EnumMember = "",
        Keyword = "",
        Constant = "󰏿",
        Snippet = "󱄽",
        Color = "󰏘",
        File = "󰈔",
        Reference = "󰬲",
        Folder = "󰉋",
        Event = "󱐋",
        Operator = "󰪚",
        TypeParameter = "󰬛",
        Error = "󰏭",
        Warning = "",
        Information = "󰋼",
        Hint = "",
      },
    },
    keymap = {
      preset = "enter",
      ["<C><leader>"] = { "show" },
      ["<C-y>"]     = { "select_and_accept" },
      ["<CR>"]      = { "accept", "fallback" },
    },
  },
}
