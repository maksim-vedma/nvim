--- @diagnostic disable: undefined-global

return {
    s({ trig = "dump"},
        fmta("{% dump(<>) %}", { i(1) })
    ),
    s({ trig = "if"},
        fmta("{% if(<>) %}<>{% endif %}", { i(1), i(2) })
    ),
    s({ trig = "for"},
        fmta("{% for(<> in <>) %}<>{% endfor %}", { i(1), i(2), i(3) })
    ),
}

