--- @diagnostic disable: undefined-global
local get_resource_name = function()
    local name = vim.fn.expand("%:t:r") -- gets filename without extension
    if name == "" or name == nil then
        return "Name"
    end

    -- 1. Capitalize the very first letter
    name = name:gsub("^%l", string.upper)

    -- 2. Find hyphens followed by a letter, remove hyphen and uppercase the letter
    -- The pattern "-(%l)" captures a lowercase letter after a hyphen
    name = name:gsub("%-(%l)", function(letter)
        return letter:upper()
    end)

    return name
end

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
            name = f(get_resource_name, {}),
        })
    ),
}
