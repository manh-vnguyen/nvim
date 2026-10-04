return {
  {
    "lervag/vimtex",
    lazy = false,

    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = "/tmp/build",
        out_dir = "build",
      }

      vim.g.vimtex_quickfix_open_on_warning = 0

      vim.keymap.set(
        "i",
        "<C-]>",
        "<Plug>(vimtex-delim-close)",
        { remap = true }
      )

      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventViewReverse",
        callback = function()
          vim.cmd("normal! zz")

          vim.fn.system({
            "hs",
            "-c",
            [[hs.window.focusedWindow():focusWindowWest()]],
          })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventView",
        callback = function()
          vim.system({
            "hs",
            "-c",
            [[hs.window.focusedWindow():focusWindowEast()]],
          })
        end,
      })
    end,
  }
}
