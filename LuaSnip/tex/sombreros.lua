local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone()

return {
  s(
    { trig = "baarr", snippetType = "autosnippet", dscr = "Bar", priority = 10 },
    fmta(
      [[ 
            \overline{<>}
            ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "tilde", snippetType = "autosnippet", dscr = "Tilde", priority = 10 },
    fmta(
      [[ 
            \tilde{<>}
            ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "vett", snippetType = "autosnippet", dscr = "Vector", priority = 10 },
    fmta(
      [[ 
            \overrightarrow{<>}
            ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "hatt", snippetType = "autosnippet", dscr = "Hat", priority = 10 },
    fmta(
      [[ 
            \hat{<>}
            ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "innoo", snippetType = "autosnippet", dscr = "[Inn]teri[oo]r", priority = 10 },
    fmta(
      [[ 
            \mathring{<>}
            ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = "(%w+)baarr",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      dscr = "OP bar",
      condition = in_mathzone,
    },
    fmta(
      [[ 
            \overline{<>}
            ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "(%w+)tilde", wordTrig = false, regTrig = true, snippetType = "autosnippet", dscr = "OP tilde" },
    fmta(
      [[ 
            \tilde{<>}
            ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "(%w+)vett", wordTrig = false, regTrig = true, snippetType = "autosnippet", dscr = "OP vet" },
    fmta(
      [[ 
            \overrightarrow{<>}
            ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    {
      trig = "(%w+)hatt",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      dscr = "OP sombrero",
    },
    fmta(
      [[ 
            \hat{<>}
            ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    ),
    { condition = in_mathzone }
  ),
  s(
    { trig = "(%w)innoo", wordTrig = false, regTrig = true, snippetType = "autosnippet", dscr = "OP [in]teri[o]r" },
    fmta(
      [[ 
            \mathring{<>}
            ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
      }
    ),
    { condition = in_mathzone }
  ),
}
