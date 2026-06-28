return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "python",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
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
  end,
}
