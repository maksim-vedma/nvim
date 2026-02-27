--- @diagnostic disable: undefined-global

-- Helper to get filename and capitalize it (e.g., article -> Article)
local get_resource_name = function()
  local name = vim.fn.expand("%:t:r") -- gets filename without extension
  if name == "" or name == nil then
    return "Name"
  end
  -- Capitalize first letter
  return name:gsub("^%l", string.upper)
end

return {
  s({ trig = "rc", desc = "React component" },
    fmta([[
export const <name> = ({ }) =>> {
  return (
    <<div>><name> component<</div>>
  )
}
]],
      {
        name = f(get_resource_name, {}),
      }
    )
  ),
  s({ trig = "us", desc = "React useState" },
    fmta([[
const [<name>, set<name_cap>] = useState(<val>);
    ]], {
      name = i(1, "state"),
      name_cap = f(function(args)
        return args[1][1]:gsub("^%l", string.upper)
      end, { 1 }),
      val = i(3, "initial")
    })
  ),
  s({ trig = "ctx", desc = "React context" },
    fmta([[
import React, { createContext, useContext, type ReactNode } from 'react';

const <name>Context = createContext(undefined);

export const <name>Provider = ({ children }) =>> {
  return (
    <<<name>Context.Provider value={{}}>>
      {children}
    <</<name>Context.Provider>>
  );
};

export const use<name> = () =>> {
  const context = useContext(<name>Context);
  if (!context) {
    throw new Error('use<name> must be used within a <name>Provider');
  }
  return context;
};
]], {
      name = f(get_resource_name, {}),
    })
  ),
}
