-- NOTE: I use LuaSnip for snippets, so I have to add it to the cmp sources.
-- See :h LuaSnip for more information.

return {
  {
    -- Autoformat by stevearc/conform.nvim not added. Will ignore from master
    "hrsh7th/nvim-cmp", --epic auto complete tab
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associtaed nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- Adds a number of user-friendly snippets
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load({ paths = { "../../../snippets/lua.lua" } })
            end,
          },
        },
      },
      "saadparwaiz1/cmp_luasnip",

      -- Adds more autocompletion stuff. nvim-cmp does not add all by default.
      "hrsh7th/cmp-nvim-lsp",
      -- Path completion
      "hrsh7th/cmp-path",
    },
    -- [[ Configure nvim-cmp]]
    -- See ` :help cmp`
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },

        -- TODO: READ ins-completion!!!
        mapping = cmp.mapping.preset.insert({
          -- [n]ext and [p]rev item
          -- ["<C-n>"] = cmp.mapping.select_next_item(),
          -- ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- [b]ack and [f]orward
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Accept ([y]es) the completion
          --  This will auto-import if LSP supports it
          --  This will expand snippets if the LSP sent a snippet
          -- WARN: PREV was <CR>
          -- Traditional:
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab"] = cmp.mapping.select_next_item(),
          ["S-Tab"] = cmp.mapping.select_prev_item(),
          -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete({}),
          -- Think of <c-l> as moving to the right of my snippet completion
          -- <c-l> will move you to the right of each of the expansion locations
          -- <s-h> is similar, except moving backwords.
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),

          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "spell" },
        },
      })
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
