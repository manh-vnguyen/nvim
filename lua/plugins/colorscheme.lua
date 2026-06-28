-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--       vim.cmd.colorscheme("gruvbox")
--     end,
--   },
-- }
return {
  {
    "catppuccin/nvim",
    name = "catppuccin", 
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
-- return {
--   {
--     "folke/tokyonight.nvim",
--     priority = 1000,
--     config = function()
--       require("tokyonight").setup({
--         style = "storm", -- try: "night", "storm", "moon", "day"
--       })
--
--       vim.cmd.colorscheme("tokyonight")
--     end,
--   },
-- }
