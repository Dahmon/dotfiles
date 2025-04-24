-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- clear existing cmds
vim.api.nvim_create_augroup("chezmoi_tmpl_ft", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "chezmoi_tmpl_ft",
  pattern = {
    "*.toml.tmpl",
    "*.json.tmpl",

    "*/.aws/config.tmpl",
    "*/.aws/credentials.tmpl",

    "*.*rc.tmpl",
    "*.*profile.tmpl",
    "*/.ssh/config.tmpl",

    "*.sh.tmpl",
    "*.zsh.tmpl",
    "*.bash.tmpl",
  },
  callback = function(args)
    local fname = vim.fn.fnamemodify(args.file, ":t")

    if fname == "config.tmpl" and args.file:match("/%.aws/") then
      vim.bo.filetype = "dosini" -- 'dosini' is good for AWS-style config
    elseif fname == "config.tmpl" and args.file:match("/%.ssh/") then
      vim.bo.filetype = "sshconfig"
    elseif fname:match("%.*rc%.tmpl$") or fname:match("profile%.tmpl$") then
      vim.bo.filetype = "sh"
    elseif fname:match("%.toml%.tmpl$") then
      vim.bo.filetype = "toml"
    elseif fname:match("%.json%.tmpl$") then
      vim.bo.filetype = "json"
    elseif fname:match("%.sh%.tmpl$") or fname:match("%.zsh%.tmpl$") or fname:match("%.bash%.tmpl$") then
      vim.bo.filetype = "sh"
    end
  end,
})
