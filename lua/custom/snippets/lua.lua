require("luasnip.session.snippet_collection").clear_snippets "lua"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

-- ctrl-k to jump to next insert node!
ls.add_snippets("lua", {
  s("el", fmt("<%= {},{},{},{} %>", { i(0), i(1), i(2), i(3) })),
})
