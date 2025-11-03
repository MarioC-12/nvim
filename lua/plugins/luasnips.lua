--Setup snippets
local luasnip_opts = function()
  local luasnip = require("luasnip")
  luasnip.setup({
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    updateevents = "TextChanged,TextChangedI",
  })

  -- Map forward jump
  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
  end, { silent = true, expr = true })

  -- Map backward jump
  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    return luasnip.jumpable(-1) and "<Plug>luasnip-jump-prev" or "<C-k>"
  end, { silent = true, expr = true })

  local config_path = vim.fn.stdpath("config") .. "/LuaSnip" -- expands to ~/.config/nvim/LuaSnip
  local workspace_specific = vim.fn.getcwd() .. "/snippets"

  require("luasnip.loaders.from_lua").lazy_load({ paths = { config_path, workspace_specific } })
  require("luasnip.loaders.from_vscode").lazy_load()

  luasnip.filetype_extend("markdown", { "markdown", "tex" })
end

return {
  "L3MON4D3/LuaSnip",
  opts = luasnip_opts,
  build = "make install_jsregexp",
  ft = {
    "tex",
    "markdown",
  },
}
