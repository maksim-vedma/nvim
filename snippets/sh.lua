--- @diagnostic disable: undefined-global
-- Function to convert a property name (e.g., 'firstname') to a Title Case name (e.g., 'Firstname')
local function to_title_case(args)
    local name = args[1] or ""
    if name:len() == 0 then return "" end
    return name:sub(1, 1):upper() .. name:sub(2)
end

return {
    s({ trig = "getopts", desc = "Argument parsing with getopts" },
        fmta([[
while getopts "vho:" opt; do
    case $opt in
    v) verbose=true ;;
    h) usage ;;
    o) ouput="${OPTARG}" ;;
    \?) # Handle invalid options
        echo "Error: Invalid option -${OPTARG}" >>&2
        exit 1
        ;;
    :) # Handle missing options
        echo "Error: Option -${OPTARG} requires an argument" >>&2
        exit 1
        ;;
    esac
done
shift $(($OPTIND - 1))
]], {
        })
    ),

    s({ trig = "usage", desc = "Usage message" },
        fmta([[
usage() {
    cat <<<<EOF
Usage: $0 [OPTIONS]
Options:
    -v verbose
    -o output
EOF
}
]], {
        })
    ),
    s({ trig = "strict", desc = "Strict mode" },
        fmta([[
set -euo pipefail
]], {
        })
    ),
}
