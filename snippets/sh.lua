--- @diagnostic disable: undefined-global

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
