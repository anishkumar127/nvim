# Neovim keymap cheat sheet

Your personal reference for shortcuts in **Cursor / VS Code** (embedded Neovim) and **standalone Neovim / Neovide**.

- **Leader key:** `<Space>` (press spacebar)
- **Modes:** `i` = insert, `n` = normal, `v` = visual, `x` = visual select

> **Source of truth:** mappings live in `lua/config/keymaps.lua`, `lua/config/vscode-keymaps.lua`, and plugin files. Update this file when you add new maps.

---

## Insert mode — exit to normal

| Key | Cursor / VS Code | Standalone Neovim |
|-----|------------------|-------------------|
| `jj` | Exit insert (via `vscode-neovim.compositeKeys` in Cursor settings) | Exit insert |
| `Esc` | Exit insert (built-in) | Exit insert |

**Cursor setup** — copy into your **Cursor User settings** (`%APPDATA%\Cursor\User\settings.json`), not just this repo. Reference copy: `.vscode/settings.json`.

```json
"vscode-neovim.compositeKeys": {
  "jj": { "command": "vscode-neovim.escape" }
},
"vscode-neovim.compositeTimeout": 300
```

If `jj` stops working: reload Cursor (`Developer: Reload Window`) and remove old `compositeEscape` entries from Keyboard Shortcuts JSON.

**Optional — `jk` saves then exits insert** (add to Cursor `settings.json`):

```json
"jk": {
  "command": "vscode-neovim.lua",
  "args": [[
    "local code = require('vscode')",
    "code.action('vscode-neovim.escape')",
    "code.action('workbench.action.files.save')"
  ]]
}
```

---

## Universal (Cursor + standalone)

Work in **normal** or **visual** mode unless noted.

| Key | What it does |
|-----|--------------|
| `<` / `>` (visual) | Indent selection, keep it selected |
| `Esc` (normal) | Clear search highlight |
| `<leader>k` | Duplicate line/selection up |
| `<leader>j` | Duplicate line/selection down |
| `<leader>pp` (visual) | Paste without yanking replaced text |

---

## Cursor / VS Code only

Uses Cursor's built-in features (LSP, git, UI). **Use Tab for Cursor autocomplete** — blink.cmp is disabled here.

### LSP & code — `<leader>c`

| Key | Action |
|-----|--------|
| `<leader>ci` | Hover / docs |
| `<leader>ca` | Code action / quick fix |
| `<leader>cn` | Next diagnostic |
| `<leader>cp` | Previous diagnostic |
| `<leader>cd` | Diagnostic under cursor |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format document |
| `<leader>cs` | Symbols in **file** |
| `<leader>cS` | Symbols in **workspace** |
| `<leader>cj` | Go to definition |
| `<leader>ck` | Go to type definition |
| `<leader>cR` | Find references |
| `<leader>cI` | Go to implementation |
| `<leader>cD` | Go to declaration |

### Quick LSP (normal mode)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gD` | Declaration |
| `gi` | Implementation |
| `K` | Hover |

### Files & search — `<leader>f` / `<leader>s`

| Key | Action |
|-----|--------|
| `<leader><space>` | Find file (quick open) |
| `<leader>ff` | Find file |
| `<leader>fr` | Recent files |
| `<leader>/` | Find in files (workspace grep) |
| `<leader>fg` | Find in files |
| `<leader>fb` | Toggle whitespace visibility |
| `<leader>ss` | Symbols in file |
| `<leader>sS` | Symbols in workspace |

### Windows, tabs, terminal

| Key | Action |
|-----|--------|
| `<leader>ft` | Toggle terminal |
| `<leader>fT` | Toggle terminal |
| `<Ctrl-/>` | Toggle terminal |
| `<leader>wv` | Split editor right |
| `<leader>ws` | Split editor down |
| `<leader>wc` | Close editor |
| `<leader>wo` | Close other editors |
| `<leader>bd` | Close buffer / editor |
| `<S-h>` | Previous editor tab |
| `<S-l>` | Next editor tab |

### Git — `<leader>g`

| Key | Action |
|-----|--------|
| `<leader>gg` | Source control panel |
| `<leader>gp` | Git panel |
| `<leader>gs` | Stage |
| `<leader>gu` | Unstage |
| `<leader>gc` | Commit |
| `<leader>gd` | Next git change |
| `<leader>gD` | Previous git change |

### Buffers & editing

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>wf` | Save **without** formatting |
| `<leader>q` | Close file |
| `<leader>qq` | Close all editors |
| `<leader>fn` | New untitled file |
| `<leader>u` | Undo |
| `<leader>U` | Redo |
| `<leader>e` / `<leader>E` | Explorer |
| `<leader>xx` | Problems panel |
| `<leader>xq` | Output panel |

### LazyVim plugins in Cursor (whitelist)

Custom `mini.lua` (gza / HJKL move) does **not** load in Cursor. LazyVim's vscode extra keeps a small subset with **default** LazyVim mappings:

| Key | Action |
|-----|--------|
| `gcc` / `gbc` | Toggle / line comment (`mini.comment`) |
| `sa` / `sd` / `sr` / `sf` | Surround add / delete / replace / find (LazyVim defaults) |
| `>` / `<` (visual) | Indent with selection kept (universal map) |

---

## Standalone Neovim / Neovide only

### LSP & diagnostics

| Key | Action |
|-----|--------|
| `<leader>ci` | Hover |
| `<leader>ca` | Code action |
| `<leader>cn` | Next diagnostic |
| `<leader>cp` | Previous diagnostic |
| `<leader>tA` | Tiny code action picker |
| `<leader>wf` | Save **without** formatting |

### Windows & splits

| Key | Action |
|-----|--------|
| `<leader>ss` | Horizontal split |
| `<leader>sv` | Vertical split |
| `<Ctrl-p>` | Previous quickfix item |
| `<Ctrl-n>` | Next quickfix item |
| `Alt-Left/Right/Up/Down` | Resize split |

### Terminal (toggleterm)

| Key | Action |
|-----|--------|
| `<leader>ft` | Floating terminal |
| `<leader>vt` | Vertical terminal (60% width) |

### Completion (blink.cmp)

| Key | Action |
|-----|--------|
| `<Ctrl-j>` (insert) | Trigger completion menu |
| `<Ctrl-y>` | Accept suggestion |
| `<Enter>` | Accept / fallback |

### AI completion (NeoCodeium — standalone only)

| Key | Action |
|-----|--------|
| `Alt-f` | Accept full suggestion |
| `Alt-w` | Accept word |
| `Alt-a` | Accept line |
| `Alt-e` | Cycle suggestions |
| `Alt-c` | Clear suggestion |

### Git (gitsigns — standalone only)

| Key | Action |
|-----|--------|
| `]c` | Next git hunk |
| `[c` | Previous git hunk |
| `<leader>ghs` | Stage hunk |
| `<leader>ghr` | Reset hunk |
| `<leader>ghu` | Undo stage |
| `<leader>ghp` | Preview hunk |
| `<leader>gbs` | Stage whole buffer |
| `<leader>gbr` | Reset buffer |
| `<leader>gbl` | Blame line |
| `<leader>gbt` | Toggle blame inline |
| `<leader>gdi` | Diff against index |
| `<leader>gdc` | Diff against commit |
| `<leader>gds` | Toggle deleted lines |

### Harpoon (standalone only)

| Key | Action |
|-----|--------|
| `s7` | Add current file |
| `s8` | Remove current file |
| `s9` | Toggle quick menu |
| `su` / `si` / `so` / `sp` | Jump to slot 1–4 |
| `s[` / `s]` | Jump to slot 5–6 |

### Surround & move (mini.nvim — standalone only)

| Key | Action |
|-----|--------|
| `gza` | Add surrounding |
| `gzd` | Delete surrounding |
| `gzr` | Replace surrounding |
| `gzf` / `gzF` | Find surrounding |
| `H` / `J` / `K` / `L` | Move line/selection |

---

## Which environment am I in?

| Environment | How it's detected | Completion |
|-------------|-------------------|------------|
| **Cursor / VS Code** | `vim.g.vscode` set | Cursor Tab / Copilot |
| **Neovide** | `vim.g.neovide` | blink.cmp + optional NeoCodeium |
| **Terminal Neovim** | Neither of above | blink.cmp + optional NeoCodeium |

---

## Useful Neovim commands

| Command | What it does |
|---------|--------------|
| `:Lazy` | Plugin manager UI |
| `:LazyExtras` | Enable/disable LazyVim extras |
| `:checkhealth` | Diagnose issues |
| `:messages` | Show recent errors/warnings |
| `:Teach` | Open this cheat sheet |

---

## File map (for editing keymaps)

| File | Purpose |
|------|---------|
| `teach.md` | This cheat sheet — read first for shortcuts |
| `lua/config/keymaps.lua` | Universal + standalone maps |
| `lua/config/vscode-keymaps.lua` | Cursor / VS Code maps |
| `lua/plugins/editor/mini.lua` | Surround, move, statusline |
| `lua/plugins/editor/gitsigns.lua` | Git hunk maps (standalone) |
| `lua/plugins/harpoon.lua` | Harpoon marks (standalone) |
| `init.lua` | Bootstrap, loads vscode-keymaps in Cursor |

---

## Tips

1. **Learn in groups:** master `jj` + `<leader>ci/ca/cn/cp` first, then files (`<leader>ff`, `<leader>/`), then git.
2. **Which-key:** in standalone Neovim, press `<leader>` and wait — LazyVim shows available keys.
3. **Cursor reload:** after changing `settings.json` or `init.lua`, run **Developer: Reload Window**.
4. **Don't fight the IDE:** in Cursor, use native Tab completion; don't enable blink.cmp or NeoCodeium there.

---

*Last updated: config cleanup — keep in sync when adding keymaps.*
