module Definition.JavaScript(
get
) where


import Definition.Data


get = Definition {
    repl      = "",
    options   = [],
    comment   = ("// ", ""),
    executors = ["Reload "],
    tools     = ["Reload "],
    debuggers = ["console.log(%s);"]
}
