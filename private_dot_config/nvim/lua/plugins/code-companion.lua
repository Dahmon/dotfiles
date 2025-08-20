return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  opts = function()
    return require("codecompanion").setup({
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "https://127.0.0.1:11434",
              -- api_key = "OLLAMA_API_KEY",
            },
            model = {
              default = "qwen2.5-coder:7b",
            },
            -- headers = {
            --   ["Content-Type"] = "application/json",
            --   ["Authorization"] = "Bearer ${api_key}",
            -- },
            parameters = {
              sync = true,
            },
          })
        end,
      }, -- this closing brace was missing
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
