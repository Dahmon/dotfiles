return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- This hook runs before Pyright initializes so we can dynamically set the python path
          before_init = function(_, config)
            local util = require("lspconfig.util")
            local path = util.path

            local function get_python_path(workspace)
              -- 1. Check if a virtual environment is explicitly activated in your shell
              if vim.env.VIRTUAL_ENV then
                return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
              end

              -- 2. Check for a local '.venv' folder (the default for the 'uv' tool)
              if workspace then
                -- Mac/Linux path
                local venv_unix = path.join(workspace, ".venv", "bin", "python")
                if vim.fn.executable(venv_unix) == 1 then
                  return venv_unix
                end

                -- Windows path (just in case)
                local venv_win = path.join(workspace, ".venv", "Scripts", "python.exe")
                if vim.fn.executable(venv_win) == 1 then
                  return venv_win
                end
              end

              -- 3. Fallback to system Python if no local venv is found
              return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
            end

            -- Inject the resolved path into the Pyright settings
            config.settings = config.settings or {}
            config.settings.python = config.settings.python or {}
            config.settings.python.pythonPath = get_python_path(config.root_dir)
          end,
        },
      },
    },
  },
}
