return {
  "numToStr/Comment.nvim",
  opts = {},
  keys = {
    {
      "<C-/>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      mode = "n",
    },
    {
      "<C-/>",
      function()
        require("Comment.api").toggle.linewise(vim.fn.visualmode())
      end,
      mode = "v",
    },
  },
}
