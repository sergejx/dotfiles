return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = function()
          return { "lsp", "path", "omni", "snippets" }
        end,
      },
    },
  },
}
