-- Compile current mermaid file into a similarly named png in the same directory
local cmd = "docker run --rm -v \"%:p:h:/data\" -u $(id -u):$(id -g) " ..
            "minlag/mermaid-cli -i \"/data/%:t\" -o \"/data/%:t:r.png\" -t dark -b black -s 4"

vim.opt_local.makeprg = cmd
