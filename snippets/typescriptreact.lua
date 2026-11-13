--- @diagnostic disable: undefined-global
local helpers = require("utils.snippets")

return {
  s({ trig = "rc", desc = "React component" },
    fmta([[
export interface <name>Props {

}

export const <name> = ({ }: <name>Props) =>> {
  return (
    <<div>><name> component<</div>>
  )
}
]],
      {
        name = f(helpers.resource_name, {}),
      }
    )
  ),
  s({ trig = "us", desc = "React useState" },
    fmta([[
const [<name>, set<name_cap>] = useState<<type>>(<val>);
    ]], {
      name = i(1, "state"),
      name_cap = f(function(args)
        return helpers.capitalize(args[1][1])
      end, { 1 }),
      -- type = i(2, "string"),
      val = i(3, "initial")
    })
  ),
  s({ trig = "ctx", desc = "React context" },
    fmta([[
import React, { createContext, useContext, type ReactNode } from 'react';

interface <name>ContextType {
}

const <name>Context = createContext<<<name>ContextType | undefined>>(undefined);

export const <name>Provider = ({ children }: { children: ReactNode }) =>> {
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
      name = f(helpers.resource_name, {}),
    })
  ),
}
