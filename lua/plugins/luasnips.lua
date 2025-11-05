--Setup snippets
local luasnip_opts = function(_, opts)
  local luasnip = require("luasnip")
  luasnip.setup(opts)

  -- Map forward jump
  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<C-j>"
  end, { silent = true, expr = true })

  -- Map backward jump
  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    return luasnip.jumpable(-1) and "<Plug>luasnip-jump-prev" or "<C-k>"
  end, { silent = true, expr = true })

  local config_path = vim.fn.stdpath("config") .. "/LuaSnip"
  local workspace_specific = vim.fn.getcwd() .. "/snippets"

  require("luasnip.loaders.from_lua").lazy_load({ paths = { config_path, workspace_specific } })
  require("luasnip.loaders.from_vscode").lazy_load()

  luasnip.filetype_extend("markdown", { "markdown", "tex" })
end

return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  opts = {
    enable_autosnippets = true,
  },
  config = luasnip_opts,
  ft = {
    "tex",
    "markdown",
  },
}
