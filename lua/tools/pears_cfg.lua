local R = require("pears.rule")

require('pears').setup(function(conf)
--   conf.pair("'", {
--     close = "'",
--     should_expand = R.all_of(
--       -- Don't expand a quote if it comes after an alpha character
--         R.not_(R.start_of_context "[a-zA-Z]"),
--       -- Only expand when in a treesitter "string" node
--         R.child_of_node "string"
--     )
--   })
end)