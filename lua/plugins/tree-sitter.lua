return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "go",
      "lua",
      "vim",
      "vimdoc",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
      "htmldjango",
      "css",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
      "toml",
    },
  },
  config = function(_, opts)
    local ts = require("nvim-treesitter")

    ts.setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
    vim.treesitter.language.register("xml", { "svg", "xslt" })
    vim.treesitter.language.register("html", "htmldjango")
  end,
}
