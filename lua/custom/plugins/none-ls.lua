return {
  -- Make sure MASON INSTALLS the sources! If possible.
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Will require MASON
        -- BUG: stylua & all others does not work via mason >:(
        -- NOTE: for manual installation. stylua is an npm/cargo package. NPM oes ot work
        null_ls.builtins.formatting.stylua,
        -- NOTE: for manual installation. stylua is an npm package
        -- null_ls.builtins.formatting.prettier,

        null_ls.builtins.diagnostics.cpplint,
      },
    })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
