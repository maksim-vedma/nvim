--- @diagnostic disable: undefined-global

return {
    s({ trig = "qs", desc = "Query Selector" },
        {
            t("document.querySelector("),
            i(1),
            t(")")
        }
    ),
    s({ trig = "qsa", desc = "Query Selector All" },
        {
            t("document.querySelectorAll("),
            i(1),
            t(")")
        }
    ),
}
