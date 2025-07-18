-- if true then return {} end
return {
  "saghen/blink.cmp",
  -- opts_extend = {
  --   -- "sources.completion.enabled_providers",
  --   "sources.compat",
  --   "sources.default",
  --   -- "ecolog",
  -- },
  -- enabled = function()
  --   return not vim.tbl_contains({  "minifiles" }, vim.bo.filetype)
  --       and vim.bo.buftype ~= "prompt"
  --       and vim.b.completion ~= false
  -- end,
  version = "1.*",
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
        -- 1) Force the Rust fuzzy matcher (or at least warn if it can't download)
   fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    completion = {
      --      trigger = {
      --         -- show the completion menu when you *enter insert mode*
      --         -- and the cursor is just after a trigger character
      --         -- show_on_insert_on_trigger_character = true,

      --         -- characters that should *not* open the menu even
      --         -- if a source asks for completion
      --         -- show_on_x_blocked_trigger_characters = {
      --         --   "'", '"', "(", "{", "[",
      --         -- },
      -- -- show_on_keyword = true
      --         show_on_trigger_character = true,
      -- -- Optionally, set a list of characters that will not trigger the completion window,
      -- -- even when sources request it. The following are the defaults:
      -- show_on_blocked_trigger_characters = { ' ', '\n', '\t' }
      --       },

      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      trigger = {
        -- show_on_accept_on_trigger_character = false,
        show_on_keyword = true, -- <-- important for `bg-`
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
              -- 2) throttle the number of items in the menu
         max_items = 20,
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
         show_with_selection   = true,   -- keep this
      show_without_selection = true,  -- <<–– important!
      show_with_menu        = true,
      show_without_menu     = true,
      },
    },
    signature = { enabled = false, window = { border = "single" } },
    -- sources = {
    --   providers = {
    --     ecolog = { name = "ecolog", module = "ecolog.integrations.cmp.blink_cmp" },
    --     codecompanion = {
    --       name = "CodeCompanion",
    --       module = "codecompanion.providers.completion.blink",
    --     },
    --   },
    --   default = { "lsp", "path", "snippets", "buffer" },
    -- },

    sources = {
      default = { "lsp", "path", "snippets", "buffer"  },
      providers = {
        -- lazydev = {
        --   name = "LazyDev",
        --   module = "lazydev.integrations.blink",
        --   score_offset = 100, -- show at a higher priority than lsp
        -- },
        lsp = {
          -- min_keyword_length = 0, -- ← allow `bg-`, `text-`, …
          fallbacks = { "buffer", "path" },
        },
        -- snippets = {
        --   min_keyword_length = 1,
        --   score_offset = 4,
        -- },
        -- lsp = {
        --   min_keyword_length = 0,
        --   score_offset = 3,
        --   name = "LSP",
        --   module = "blink.cmp.sources.lsp",
        --   fallbacks = {},
        -- },
        -- path = {
        --   min_keyword_length = 0,
        --   score_offset = 2,
        -- },
        -- buffer = {
        --   min_keyword_length = 1,
        --   score_offset = 1,
        -- },
      },
    },
    cmdline = {
      enabled = true,
      ---@diagnostic disable-next-line: assign-type-mismatch
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
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
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
      kind_icons = {
        Text = "󰉿",
        Method = "",
        Function = "󰊕",
        Constructor = "󰒓",
        Field = "",
        Variable = "󰆦",
        Property = "󰖷",
        Class = "",
        Interface = "",
        Struct = "󱡠",
        Module = "󰅩",
        Unit = "󰪚",
        Value = "󰫧",
        Enum = "",
        EnumMember = "",
        Keyword = "",
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
        Warning = "",
        Information = "󰋼",
        Hint = "",
      },
    },
    keymap = {
      -- preset = "enter",
      -- ["<C-y>"] = { "select_and_accept" },
          -- keep the `enter` preset (so `<CR>` accepts)…
      preset = "enter",
      -- but re-add the ctrl-space mapping in case it was overridden:
     -- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C><leader>"] = { "show",  },
      ["<C-y>"]     = { "select_and_accept" },
      ["<CR>"]     = { "accept","fallback" },
    },
  },
}
