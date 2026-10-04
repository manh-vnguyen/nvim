return {
  {
    'saghen/blink.cmp',

    dependencies = {
      'rafamadriz/friendly-snippets',
      'krissen/blink-cmp-bibtex',
    },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "bibtex",
        },

        providers = {
          bibtex = {
            module = "blink-cmp-bibtex",
            name = "BibTeX",

            min_keyword_length = 1,
            score_offset = 100,
            async = true,

            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.filter_text = table.concat({
                  item.label or "",
                  item.detail or "",
                }, " ")
              end

              return items
            end,
          },
        },
      },

      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
    },

    opts_extend = {
      'sources.default',
    },
  },
}
