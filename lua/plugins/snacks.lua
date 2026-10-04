return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      picker = { enabled = true },
    },
  },
  {
    "krissen/snacks-bibtex.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },

    opts = {
      context = {
        enabled = true,
        fallback = true,
        inherit = true,
      },

      search_fields = {
        "author",
        "year",
        "title",
        "journal",
        "journaltitle",
        "editor",
      },

      display = {
        show_key = true,

        preview_fields = {
          "title",
          "author",
          "year",
        },

        preview_fields_separator = " — ",

        show_preview = true,
      },

      default_insert_mode = "key",
    },

    keys = {
      {
        "<leader>fc",
        function()
          require("snacks-bibtex").bibtex()
        end,
        desc = "Find citation",
      },
    },
  },
}
