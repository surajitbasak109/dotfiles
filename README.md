**_Continue watching:_**
https://laracasts.com/series/neovim-as-a-php-ide/episodes/19

**_NERD Fonts to download_**:
https://www.nerdfonts.com/font-downloads

**_Kitty configuration_**:
https://sw.kovidgoyal.net/kitty/conf/

**_Dotfiles repo_**:
https://github.com/jessarcher/dotfiles/

**_Keymaps.lua**:
https://github.com/jessarcher/dotfiles/blob/master/nvim/lua/user/keymaps.lua

**_Neovim kickstart.nvim init.lua_**:
https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

## Recommended downloads for zsh using oh-my-zsh
```bash
# zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# Keep this in .zshrc
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins (
    zsh-autosuggestions
)
# zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=( [plugins...] zsh-syntax-highlighting)
```
