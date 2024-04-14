-- NOTE: ADDED NEW MASTER CHANGES
--
-- Provides go to definition
-- Find references
-- Autocompletion
-- Symbol search and other stuff
--
-- In my end mason does not work on certian OS's, therefore it is stripped down without any autoinstalls.

return {

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- WARN: Automatically install LSPs to stdpath for neovim, DOES NOT WORK WITH ARM CPU's :(((
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },

  --WARN: Lua-Language-Server (Installed from source on ARM). Will require to remove mason.nvim package & uninstall it's packages
  require("lspconfig").lua_ls.setup({}),

  --WARN: Clangd-Language-Server (From local package manager)
  require("lspconfig").clangd.setup({}),

  --WARN: Bash-Language-Server (Installed from npm). Requires latest stable Nodejs.
  --NOTE: I may have done this the hard way...
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    callback = function()
      vim.lsp.start({
        name = "bash-language-server",
        cmd = { "bash-language-server", "start" },
      })
    end,
  }),

  -- [[Configure LSP]] Moved to its own directory
  -- This function gets run when an LSP connects to a particular buffer.

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Makes the following code to work. map variable
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        --  map('<leader>cb', require('dap').toggle_breakpoint, 'DAP: Toggle [B]reakpoint')
        --  map('<leader>cc', require('dap').continue, 'DAP: [C]ontinue')

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- See `:help K` for why this keymap
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Lesser used LSP functionality
        -- declaration will take to header in C
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        map("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        --Autocommand --> Highlight references of word under cursor.
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.clear_references,
          })
        end
      end,
    })

    -- BUG: FROM INIT, before nvim-cmp section
    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.

    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},
      -- html = {},
      -- lua_ls = { -- auto_install lua_ls does not work
      --  settings = {
      --    Lua = {
      --      completion = {
      --        callSnippet = "Replace",
      --      },
      --    },
      --    telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
      --  },
      --  },
    }

    -- FIX: Mason may not work with all LSP's. Keep mason_lspconfig at minimum, until I know what works. Looking at u lua_ls
    -- WARN: Setup mason so it can manage external tooling
    require("mason").setup()

    -- local mason_lspconfig = require("mason-lspconfig")
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    -- WARN:
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}

          server.capabilities = vim.tbl_deep_extend("force", capabilities, server.capabilities or {})
        end,
      },
    })

    --[[
  mason_lspconfig.setup_handlers({
  function(server_name)
  require("lspconfig")[server_name].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = servers[server_name],
  filetypes = (servers[server_name] or {}).filetypes,
  })
  end,
  })
  --]]
  end,
}

-- vim: ts=2 sts=2 sw=2 et
