return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    lazy = false,
    build = ":UpdateRemotePlugins",

    dependencies = {
      {
        "3rd/image.nvim",
        build = false,
        dependencies = {
          "nvim-lua/plenary.nvim",
        },
        opts = {
          backend = "kitty",
          processor = "magick_cli",

          max_width = 100,
          max_height = 30,

          max_width_window_percentage = math.huge,
          max_height_window_percentage = math.huge,

          window_overlap_clear_enabled = true,
          window_overlap_clear_ft_ignore = {
            "cmp_menu",
            "cmp_docs",
            "",
          },

          integrations = {
            markdown = {
              enabled = true,
            },
          },
        },
      },
    },

    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 50
      vim.g.molten_auto_open_output = true
      vim.g.molten_wrap_output = true
    end,

    keys = {
      {
        "<leader>mi",
        "<cmd>MoltenInit<CR>",
        desc = "Molten: initialize kernel",
      },
      {
        "<leader>ml",
        "<cmd>MoltenEvaluateLine<CR>",
        desc = "Molten: evaluate line",
      },
      {
        "<leader>mr",
        "<cmd>MoltenReevaluateCell<CR>",
        desc = "Molten: reevaluate cell",
      },
      {
        "<leader>md",
        "<cmd>MoltenDelete<CR>",
        desc = "Molten: delete cell",
      },
      {
        "<leader>mo",
        "<cmd>MoltenShowOutput<CR>",
        desc = "Molten: show output",
      },
      {
        "<leader>mh",
        "<cmd>MoltenHideOutput<CR>",
        desc = "Molten: hide output",
      },
      {
        "<leader>mx",
        "<cmd>MoltenInterrupt<CR>",
        desc = "Molten: interrupt kernel",
      },
      {
        "<leader>me",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        mode = "x",
        silent = true,
        desc = "Molten: evaluate selection",
      },
      {
        "<leader>m",
        "<cmd>MoltenEvaluateOperator<CR>",
        mode = "n",
        desc = "Molten: evaluate motion",
      },
    },
  },
} 
