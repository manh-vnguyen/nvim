return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",

    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Option 1: keep <C-d> for scrolling, use <C-n>
      set({ "n", "x" }, "<C-n>", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor to next match" })

      set({ "n", "x" }, "<C-p>", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add cursor to previous match" })

      set({ "n", "x" }, "<A-n>", function()
        mc.matchSkipCursor(1)
      end, { desc = "Skip next match" })

      set({ "n", "x" }, "<leader>A", mc.matchAllAddCursors, {
        desc = "Add cursors to all matches",
      })

      set({ "n", "x" }, "<C-q>", mc.toggleCursor, {
        desc = "Toggle multicursor",
      })

      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<Esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
}
