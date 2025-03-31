local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

-- Define snippets
ls.snippets = {
  c = {
    snip("cprog", {
      text("#include <stdio.h>\n"),
      text("#include <string.h>\n\n"),
      text("int main(int argc, char *argv[]) {\n"),
      text("    "), insert(1, "// Your code here"), text("\n"),
      text("    return 0;\n"),
      text("}\n")
    })
  }
}

return ls.snippets -- Return the snippets table so it can be loaded
