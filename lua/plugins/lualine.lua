return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
      },
      sections = {
        lualine_c = {
          function()
            return require("utils.pomodoro").status()
          end,
        },
      },
    })
  end,
}
