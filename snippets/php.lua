--- @diagnostic disable: undefined-global

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
            t({ "<?php foreach ($" }), i(1, "iter"), t({" as $key => $"}), i(2, "item"), t({") : ?>", "\t" }),
            i(3),
            t({ "", "<?php endforeach; ?>" })
        }
    ),
    s({ trig = "pred"},
        {
            t({"<pre>"}),
            t({"<?php var_dump($"}),
            i(1, "data"),
            t({ "); ?>"}),
            t({"</pre>"}),
        }
    ),
}
