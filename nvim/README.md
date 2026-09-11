# Neovim config

Kickstart-derived config, split so each plugin owns a file.

- `init.lua` — leader key, bootstraps `lazy.nvim`, imports `custom.plugins`, then
  `settings` and `mappings`.
- `lua/custom/plugins/*.lua` — every file returns a lazy.nvim plugin spec and is
  auto-imported by the `{ import = "custom.plugins" }` line in `init.lua`. To add
  a plugin, drop in a new file; there is no list to register it in.

---

## 1. How to add a new LSP

Everything happens in `lua/custom/plugins/lsp.lua`.

### Pick a server

Use the **lspconfig** name, not the Mason package name. Sources:

```vim
:help lspconfig-all
```

or list what's available:

```bash
ls ~/.local/share/nvim/lazy/nvim-lspconfig/lsp/
```

The filename minus `.lua` is the server name (`terraformls`, `yamlls`,
`dockerls`, `bashls`, …).

### Add to `servers` table

Add an entry to `servers` (currently around line 86). An empty table is enough
for a server you don't need to tune:

```lua
local servers = {
    -- ...existing entries...

    terraformls = {},
}
```

The servers table is passed to `vim.lsp.config(server, config)` and
merged _over_ the defaults `nvim-lspconfig` so `lsp/<server>.lua`
inherits `cmd`, `filetypes`, and root markers alongide your config:

```lua
terraformls = {
    settings = {
        terraform = {
            experimentalFeatures = { validateOnSave = true },
        },
    },
},
```

### Verify install

```vim
:Lazy sync      " if you also changed plugin specs
:Mason          " confirm the server shows as installed
```

Then open a file of that filetype and check it actually attached:

```vim
:checkhealth vim.lsp
:LspInfo
```

An installed-but-not-attached server is usually a filetype mismatch or a missing
root marker (most servers need a project root — e.g. `gopls` wants `go.mod`), not
an install problem.

---

## 2. How to add a new formatter

### Map filetype in `conform.lua`

In `lua/custom/plugins/conform.lua`, add to `formatters_by_ft`:

```lua
formatters_by_ft = {
    -- ...
    terraform = { "terraform_fmt" },
}
```

Note:

- `{ "a", "b" }` — run **both**, in order.
- `{ "a", "b", stop_after_first = true }` — run the **first available only**

Formatter names come from conform's built-in list:

```vim
:h conform-formatters
```

or `ls ~/.local/share/nvim/lazy/conform.nvim/lua/conform/formatters/`.

### Step 2 — add the binary to Mason in `lsp.lua`

In `lua/custom/plugins/lsp.lua`, add the **Mason package name** to the
`vim.list_extend(ensure_installed, { ... })` block:

```lua
vim.list_extend(ensure_installed, {
    "stylua",
    -- ...
    "shfmt",
})
```

### Step 3 — verify

```vim
:ConformInfo
```
