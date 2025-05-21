return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Mode | branch > repo > fullpath --- progress < location
      -- Remove clock
      opts.sections.lualine_z = {}
    end,
  },
}
