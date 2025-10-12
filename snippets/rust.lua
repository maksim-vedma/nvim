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
    s({ trig = "tws", desc = "Tailwind Struct" },
        fmta([[
#[derive(TwClass)]
#[tw(
    class = "<classes>"
)]
struct <struct>Style {
    variant: Variant,
}
    ]], {
            classes = i(2, "classes"),
            struct = i(1, "struct"),
        })
    ),
    s({ trig = "twe", desc = "Tailwind Enum" },
        fmta([[
#[derive(TwVariant, strum_macros::EnumIter, strum_macros::Display)]
pub enum <enum> {
    #[strum(to_string = "default")]
    #[tw(default, class = "<classes>")]
    Default,
}
    ]], {
            enum = i(1, "enum"),
            classes = i(2, "classes"),
        })
    ),
    s({ trig = "lc", desc = "Leptos Component" },
        fmta([[
#[component]
pub fn <componentname>(
    #[prop(into, optional)] class: Signal<<String>>,
) ->> impl IntoView {
    view! {
        <<div>><content><</div>>
    }
}
    ]], {
            componentname = i(1, "componentname"),
            content = i(2, "content"),
        })
    ),
    s({ trig = "ls", desc = "Leptos Signal" },
        fmta([[
let (<var>, set_<var>) = signal::<<<type>>>(<initial>);
    ]], {
            var = i(1, "signal"),
            initial = i(2, "initial"),
            type = i(3, "type"),
        })
    ),
    s({ trig = "lrw", desc = "Leptos RwSignal" },
        fmta([[
let <var> = RwSignal::new(<initial>);
    ]], {
            var = i(1, "signal"),
            initial = i(2, "initial"),
        })
    ),
    s({ trig = "lsus", desc = "Leptos Suspense" },
        fmta([[
<<Suspense
    fallback=move || view! { <<p>>"Loading..."<</p>> }
>>
    {move || {
        <ressource>.get()
            .map(|b| view! { <<Component prop=ressource />> })
    }}
<</Suspense>>
    ]], {
            ressource = i(1, "ressource"),
        })
    ),
    s({ trig = "ltrans", desc = "Leptos Transition" },
        fmta([[
<<Transition
    fallback=move || view! { <<p>>"Loading initial data..."<</p>> }
    set_pending
>>
    <<p>>
        {move || <ressource>.read().as_deref().map(ToString::to_string)}
    <</p>>
<</Transition>>
    ]], {
            ressource = i(1, "ressource"),
        })
    ),
}
