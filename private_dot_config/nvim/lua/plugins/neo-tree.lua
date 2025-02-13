return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignores = false,
          hide_hidden = false, -- windows
        },
      }
    end,
  },
}
