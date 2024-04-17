-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Git related plugins
  -- "tpope/vim-fugitive",
  -- "tpope/vim-rhubarb",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim",       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },

  -- Useful plugin to show you pending keybinds.
  -- NOTE: Registers are in main init.lua
  -- TODO: MOVE registers here
  { "folke/which-key.nvim",  opts = {} },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes. APPEARS AT LUALINE
    "lewis6991/gitsigns.nvim",
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      -- WARN: Master removed these! I still kinda used it?
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ "n", "v" }, "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to next hunk" })

        map({ "n", "v" }, "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Jump to previous hunk" })

        -- Actions
        -- visual mode
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "stage git hunk" })
        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "reset git hunk" })
        -- normal mode
        map("n", "<leader>hs", gs.stage_hunk, { desc = "git stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "git reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "git Stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "git Reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "preview git hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = false })
        end, { desc = "git blame line" })
        map("n", "<leader>hd", gs.diffthis, { desc = "git diff against index" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "git diff against last commit" })

        -- Toggles
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "toggle git blame line" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle git show deleted" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select git hunk" })
      end,
    },
  },

  { -- Theme inspired by Atom.
    "navarasu/onedark.nvim",
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("onedark")
    -- end,
  },

  {
    "sainnhe/everforest",
    priority = 500,
    -- config = function()
    -- vim.cmd.colorscheme("everforest")
    -- end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  { -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = "|",
        section_separators = "",
      },
    },
  }, -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require("mini.statusline")
      -- set use_icons to true if you have a Nerd Font
      statusline.setup({ use_icons = vim.g.have_nerd_font })

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  -- NOTE: Personal STARTS HERE! sync with GIT please! :)
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim",
    },
    -- config = true,
    config = function ()
      -- Neogit and Shortcut
      local neogit = require("neogit")
      vim.keymap.set("n", "<leader>gO", function()
        neogit.open({ kind = "split" })
      end, { desc = "Open Neogit" })
    end
  },

  "norcalli/nvim-colorizer.lua",
  "andweeb/presence.nvim",

  -- See :h autoclose.nvim-*
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({
        keys = {
          -- ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
        },
      })
    end,
  },

  {
    --see :h bufferline-configuration
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- Changed from tabs.
          numbers = "ordinal",
        },
      })
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        shortcut_type = "number",
        config = {
          shortcut = {

            --Used my personal directory,$USER did not work. -- Compare GIT before changing
            {
              desc = "Files [WIN]",
              group = "Label",
              action = "Telescope find_files cwd=D:\\",
              key = "f",
            },
            {
              desc = "Config [WIN]",
              -- action "e " .. os.getenv("HOMEPATH") .. "\\AppData\\Local\\nvim\\init.lua"
              action = "e C:\\Users\\marco\\AppData\\Local\\nvim\\init.lua",
              key = "e",
            },
            { desc = "Config [LIN]", action = "e ~/config/nvim/init.lua", key = "E" },
          },
          project = {
            enable = "True",
            action = "Telescope find_files cwd=",
          },
          week_header = {
            enable = "true",
          },
        },
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          side = "right", -- I like it to show on right. Like a boss
        },
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,    -- use a classic bottom cmdline for search
          command_palette = true,  -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,      -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,  -- add a border to hover docs and signature help
        },
      })
    end,
  },

  -- NOTE: Personal configuration ends here
}
-- vim: ts=2 sts=2 sw=2 et
