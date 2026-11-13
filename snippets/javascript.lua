--- @diagnostic disable: undefined-global
local helpers = require("utils.snippets")

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
    s({ trig = "enum", desc = "Typescript not-enum" },
        fmta([[
export const <name>Enum = {
    TODO: "variant",
} as const;

export type <name> = typeof <name>Enum[keyof typeof <name>Enum];

export abstract class <name>Impl {
    static getLabel(variant: <name>) {
        switch (variant) {
            case <name>Enum.TODO: return "";
        }
    }
}
]], {
            name = f(helpers.resource_name, {}),
        })
    ),
}
