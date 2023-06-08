-- Author: IA
-- Device: PC


return {
    {
        "L3MON4D3/LuaSnip",
        event = 'InsertEnter',
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({ exclude = {"html"} })
            require("luasnip.loaders.from_lua").lazy_load()
            -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

            local ls = require("luasnip")
            local snip = ls.snippet
            local node = ls.snippet_node
            local text = ls.text_node
            local insert = ls.insert_node
            local func = ls.function_node
            local choice = ls.choice_node
            local dynamic = ls.dynamic_node
            -- local r = ls.restore_node
            -- local l = require("luasnip.extras").lambda
            -- local rep = require("luasnip.extras").rep
            -- local p = require("luasnip.extras").partial
            -- local m = require("luasnip.extras").match
            -- local n = require("luasnip.extras").nonempty
            -- local dl = require("luasnip.extras").dynamic_lambda
            -- local fmt = require("luasnip.extras.fmt").fmt
            -- local fmta = require("luasnip.extras.fmt").fmta
            -- local types = require("luasnip.util.types")
            -- local conds = require("luasnip.extras.conditions")
            -- local conds_expand = require("luasnip.extras.conditions.expand")

            ls.add_snippets(nil, {
                fish = {
                    snip({ trig = "fun", namr = "Function", dscr = "Function" },
                    {
                        text({"function "}), insert(1, "func_name"), text({"", "\t"}), insert(2), text({"", "end", "", ""}), insert(0)
                    }),

                    snip({ trig = "switch", namr = "Switch", dscr = "Switch statement" },
                    {
                        text({"switch $"}), insert(1, "arg"), text({"", "    case '"}), insert(2, "case"), text({"'", "        "}), insert(3), text({"", "end", "", ""})
                    }),

                    --TODO: Add condition to trigger only inside switch statement
                    snip({ trig = "case", namr = "Switch Case", dscr = "Switch Case" },
                    {
                        text({"case '"}), insert(1, "case"), text({"'", "    "}), insert(2)
                    }),

                    snip({ trig = "if", namr = "If", dscr = "If Statement" },
                    {
                        text({"if "}), insert(1, "condition"), text({"", "    "}), insert(2), text({"", "end", "", ""})
                    }),

                    snip({ trig = "elif", namr = "If/Else-If", dscr = "If/Else-If Statement" },
                    {
                        text({"if "}), insert(1, "condition"), text({"", "    "}), insert(2), text({"", "else if "}), insert(3, "condition"), text({"", "    "}), insert(4), text({"", "else "}), insert(5, "condition"), text({"", "    "}), insert(6), text({"", "end", "", ""})
                    }),

                    snip({ trig = "else", namr = "If/Else", dscr = "If/Else Statement" },
                    {
                        text({"if "}), insert(1, "condition"), text({"", "    "}), insert(2), text({"", "else "}), insert(3, "condition"), text({"", "    "}), insert(4), text({"", "end", "", ""})
                    }),
                },

                --TODO: Add condition to trigger at start of line
                markdown = {
                    snip({ trig = "csnote", namr = "CS Note", dscr = "Metadata for CS Notes", }, {
                        text({"---", "Type: Permanent Note", "Topic: CS", "Title: "}), insert(1), text({"", "Related: "}), insert(2), text({"", "---", "", "", ""}), insert(0)
                    }),

                    snip({ trig = "langnote", namr = "Language Note", dscr = "Metadata for Language Notes", }, {
                        text({"---", "Type: Permanent Note", "Topic: Language/"}), insert(1, "English"), text({"", "Title: "}), insert(2), text({"", "---", "", "", ""}), insert(0)
                    }),

                    snip({ trig = "litnote", namr = "Literature Note", dscr = "Metadata for Literature Notes", }, {
                        text({"---", "Type: Literature Note", ""}), insert(1, "Book"), text({": "}), insert(2), text({"", "Author: "}), insert(3), text({"", "---", "", "", ""}),
                        insert(0)
                    }),

                    snip({ trig = "wikinote", namr = "Wiki Note", dscr = "Metadata for Wiki notes", }, {
                        text({"---", "Type: Permanent Note", "Topic: "}), insert(1), text({"", "Topic"}), insert(2), text({"", "Related: "}), insert(3), text({"", "---", "", "", ""}), insert(0)
                    }),

                    snip({ trig = "src", namr = "Source", dscr = "Sources cited from", }, {
                        text({"Source", "---", ""}), insert(1), }),

                    snip({ trig = "rel", namr = "Related", dscr = "Related files", }, {
                        text({"[[./"}), insert(1), text({"]] "}), insert(0) }),
                }
            })
        end
    }
}
