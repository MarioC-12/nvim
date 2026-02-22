return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {

      -- Disable Enter confirmation
      ["<CR>"] = cmp.config.disable,

      -- Explicit confirm key
      ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),

      -- Tab cycles forward
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Shift-Tab cycles backward
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
