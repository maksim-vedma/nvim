--- @diagnostic disable: undefined-global
local helpers = require("utils.snippets")

return {
    s({ trig = "pecho", snippetType = "autosnippet" },
        {
            t("<?= "),
            i(1),
            t(" ?>"),
        }
    ),
    s({ trig = "pif", snippetType = "autosnippet" },
        {
            t({ "<?php if (" }), i(1, "condition"), t({ ") : ?>", "\t" }),
            i(2),
            t({ "", "<?php endif; ?>" })
        }
    ),
    s({ trig = "pel", snippetType = "autosnippet" },
        {
            t({ "<?php else : ?>" }),
        }
    ),
    s({ trig = "pfor", snippetType = "autosnippet" },
        {
            t({ "<?php foreach ($" }), i(1, "iter"), t({ " as $key => $" }), i(2, "item"), t({ ") : ?>", "\t" }),
            i(3),
            t({ "", "<?php endforeach; ?>" })
        }
    ),
    s({ trig = "pwhile", snippetType = "autosnippet" },
        {
            t({ "<?php while ($" }), i(1, "condition"), t({ ") : ?>", "\t" }),
            i(2),
            t({ "", "<?php endwhile; ?>" })
        }
    ),
    s({ trig = "pred" },
        {
            t({ "<pre>" }),
            t({ "<?php var_dump($" }),
            i(1, "data"),
            t({ "); ?>" }),
            t({ "</pre>" }),
        }
    ),
    s({ trig = "get(%w+)", regTrig = true, hidden = true },
        fmt([[
public function get{}(): {}
{{
    return $this->{};
}}
]], {
            f(function(_, snip)
                return helpers.capitalize(snip.captures[1])
            end),
            i(1, "mixed"),
            f(function(_, snip)
                return snip.captures[1] or ""
            end),
        })
    ),
    s({ trig = "set(%w+)", regTrig = true, hidden = true },
        fmt([[
public function set{}({} $value): static
{{
    $this->{} = $value;
    return $this;
}}
]], {
            f(function(_, snip)
                return helpers.capitalize(snip.captures[1])
            end),
            i(1, "mixed"),
            f(function(_, snip)
                return snip.captures[1] or ""
            end),
        })
    ),

}
