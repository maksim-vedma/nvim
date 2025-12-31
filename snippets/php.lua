--- @diagnostic disable: undefined-global
-- Function to convert a property name (e.g., 'firstname') to a Title Case name (e.g., 'Firstname')
local function to_title_case(args)
    local name = args[1] or ""
    if name:len() == 0 then return "" end
    return name:sub(1, 1):upper() .. name:sub(2)
end

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
                local name = snip.captures[1] or ""
                return name:sub(1, 1):upper() .. name:sub(2)
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
                local name = snip.captures[1] or ""
                return name:sub(1, 1):upper() .. name:sub(2)
            end),
            i(1, "mixed"),
            f(function(_, snip)
                return snip.captures[1] or ""
            end),
        })
    ),

}
