--- @diagnostic disable: undefined-global
-- Function to convert a property name (e.g., 'firstname') to a Title Case name (e.g., 'Firstname')
local function to_title_case(args)
    local name = args[1] or ""
    if name:len() == 0 then return "" end
    return name:sub(1, 1):upper() .. name:sub(2)
end

return {
    s({ trig = "lfor", desc = "Leptos <For/> loop" },
        fmta([[
<<For
    each=move || <signal>.get()
    key=|<item>| <item>.id
    children=move |<item>| {{
        view! {{
            <<div>><item><</div>>
        }}
    }}
/>>
    ]], {
            signal = i(1, "signal"),
            item = i(2, "item"),
        })
    ),
    s({ trig = "liter", desc = "Leptos iter().map()collect_view() loop" },
        fmta([[
{<items>
    .iter()
    .map(|item| {
        view! {
            <<li>>
                <item>
            <</li>>
        }
    })
    .collect_view()} // Version avec For + Signal
    ]], {
            items = i(1, "items"),
            item = i(2, "item"),
        })
    ),
}
