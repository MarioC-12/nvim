local M = {}

function M.get_visual(args, parent)
  local ls = require("luasnip")
  local sn = ls.snippet_node
  local i = ls.insert_node

  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

return M
