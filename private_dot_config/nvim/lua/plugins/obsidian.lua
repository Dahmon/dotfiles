return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see above for full list of optional dependencies ☝️
  },
  ---@module 'obsidian'
  ---@type obsidian.config.ClientOpts
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/workspace/KnowledgeBase",
      },
    },
    daily_notes = {
      folder = "daily",
      template = "daybook-template.md",
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
    picker = {
      name = "fzf-lua",
    },
    ui = {
      -- Rendering handled by render-markdown.nvim
      enable = false,
    },
    templates = {
      folder = "Meta/Templates",
    },
    disable_frontmatter = true,
    sort_by = "modified",
    sort_reversed = true,
  },
}
