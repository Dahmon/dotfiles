return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  opts = {
    provider = "ollama",
    ollama = {
      model = "qwen2.5-coder:7b",
      --model = "deepseek-coder-v2:16b",
      stream = true,
    },
  },
}
