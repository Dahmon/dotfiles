return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  opts = {
    provider = "openai",
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_completion_tokens = 8192,
          reasoning_effort = "medium",
        },
      },
      ollama = {
        model = "qwen2.5-coder:7b",
      },
    },
  },
}
