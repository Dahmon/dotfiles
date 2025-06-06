# Dahmon dotfiles

Setup: `/bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/Dahmon/dotfiles/refs/heads/main/.setup.sh)"`

## TODO

- [ ] Fix neotest
- [ ] Add `vim-oscyank` so i can copy to clipboard
- [ ] Update to use externals for zsh and plugins
- [ ] Fork git.zsh and simplify a lot of aliases to be more my liking
- [ ] Clone `git-fzf` to a better location
  - Josean Martinez puts everything in a folder in `~/.config/<lib>`
    I think it's pretty standard to load from there
- [ ] Create a scripted `aerospace` and `tmux` setup
  - Workspace 1, accordion, top to bottom Ghostty, Firefox, Obsidian
  - Workspace 5, Spotify
- [ ] git blame in nvim status bar
  - [LazyVim gitsigns](https://www.lazyvim.org/plugins/editor#gitsignsnvim-1)
- [ ] hex.nvim
- [ ] markview.nvim
  - [Snacks](https://github.com/folke/snacks.nvim/blob/main/docs/git.md#snacksgitblame_line)
- [ ] Harpoon2 nvim
- [ ] Update nvim window resize to `Alt-Arrow`
- [ ] cron job that runs `https://github.com/vjeantet/alerter` if I'm below 20% and not charging
- [ ] Add [`typr`](https://github.com/nvzone/typr) typing plugin

## Issues

- Obsidian seems to completely replace `Custom Dictionary.txt`, breaking our symlink
