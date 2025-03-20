# ARVIM V2.0

## Description

This is an nvim configuration based on NVChad that is optimized for python development.


## Requirements

1. Install xclip (Necessary for system clipboard sync)
2. Install ripgrep (rg) to enable fuzzy finding within telescope.
3. Install lazygit (Optional) for better git support in nvim. for complete installation instructions
   or for other os systems, checkout the [documentation](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation)
4. Install `fd` for better support with telescope.
5. Install node

### Code

```bash
sudo apt install xclip
sudo apt install ripgrep

# Install lazygit for Debian / Ubuntu
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

# Installing fd for telescope
apt install fd-find

# Download and install npm through nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# Set the env variables for this session only, it will be automatically added to your .zshrc file.
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Install npm latest version (Neened for nvim dependancies)
nvm install node  # run `nvm install <VERSION>` to install a specific version (e.g. 18 for the latest patch of node18)
nvm use node  # run `nvm use <VERSION>` to use a specific version of node
```

## Installation

1. Backup your current nvim installation:

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Or delete everything if you don't need to do back
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

2. Clone the repository

```bash
git clone https://github.com/aiokaizen/arvim2.git ~/.config/nvim
```

3. Start neovim using the `nvim` command. This will install `lazy.nvim` and all its dependancies.

4. Install Mason dependancies using `:MasonInstallALL` command.


## Options

## Keymaps

### Folding

| Mode                                                                                      | Keymap             | Description                             | Example                         |
| ----------------------------------------------------------------------------------------- | ------------------ | --------------------------------------- | ------------------------------- |
| <span style="background: #d0f4de; display: inline-block; padding: 0px 5px;">Visual</span> | `z` `f`            | Fold selection                          |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `f` `{motion}` | Fold motion                             | "Positions at oppening `{`" zf% |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `o`            | Open fold at the cursor.                |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `c`            | Close fold at the cursor.               |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `a`            | Toggle fold at the cursor.              |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `d`            | Delete fold at the cursor.              |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `Shift` `r`    | Open all folds                          |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `Shift` `m`    | Close all folds                         |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `Shift` `e`    | Delete all folds in window              |                                 |
| <span style="background: #fcf6bd; display: inline-block; padding: 0px 5px;">Normal</span> | `z` `x`            | Recalculate folds in the current window |                                 |
