return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  keys = {
    {
      "<leader>e",
      "<cmd>NvimTreeToggle<CR>",
      desc = "Toggle Explorer",
    },
    {
      "<leader>o",
      "<cmd>NvimTreeFocus<CR>",
      desc = "Focus Explorer",
    },
  },

  opts = {

    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      -- Load all default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Enter directory (change root)
      vim.keymap.set("n", "<Tab>", api.tree.change_root_to_node, {
        buffer = bufnr,
        desc = "Enter Directory",
        noremap = true,
        silent = true,
      })
    end,

    sort = {
      sorter = "case_sensitive",
    },

    view = {
      width = 35,
      side = "left",
      preserve_window_proportions = true,
    },

    renderer = {
      group_empty = true,
      highlight_git = true,
      highlight_opened_files = "name",

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
      },
    },

    filters = {
      dotfiles = false,
      git_ignored = false,
    },

    git = {
      enable = true,
      ignore = false,
    },

    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "󰌵",
        info = "󰋼",
        warning = "",
        error = "",
      },
    },

    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
      },
    },

    update_focused_file = {
      enable = true,
      update_root = false,
    },

    filesystem_watchers = {
      enable = true,
    },
  },
}
-- return {
--   'stevearc/oil.nvim',
--   ---@module 'oil'
--   ---@type oil.SetupOpts
--   opts = {},
--   -- Optional dependencies
--   dependencies = { { "nvim-mini/mini.icons", opts = {} } },
--   -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
--   -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
--   lazy = false,
-- }
