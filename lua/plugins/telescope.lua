return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>" },
    { "<leader>fs", function()
        require("telescope.builtin").grep_string({
          search = vim.fn.input("Grep > "),
        })
      end
    },
  },
}
