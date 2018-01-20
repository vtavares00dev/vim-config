# Victor Tavares' neovim Configuration

To install from scratch:

* install neovim and Python with homebrew (if needed):
  `brew install python`
  `brew install python3`
  `brew install neovim`

* install pip via easy_install (if needed):
  `sudo easy_install pip`

* pip install neovim modules (if needed):
  `sudo pip install neovim`
  `sudo pip3 install neovim`

* remove or backup your `~/.nvimrc` file and `~/.vim` directory

* bring down github archive
  `git clone https://github.com/vtavares00dev/vim-config.git ~/.vim`

* add the following to your ~/.config/nvim/init.vm file:
```
    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=~/.vim
    source ~/.nvimrc
```

* symlink your .nvimrc
  `ln -s ~/.vim/nvimrc ~/.nvimrc`

* install/update all plugins (using plug): `nvim +PlugInstall! +qall`

* install the Nerd Fonts for vim-devicons plugin

* restore iTerm2 preferences file `com.googlecode.iterm2.plist`

* start nvim and profit!

