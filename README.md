# Victor Tavares' neovim Configuration on OS X

To install on OS X from scratch:

* install neovim and Python with homebrew (if needed):
  `brew install python`
  `brew install python3`
  `brew install neovim`

* pip install neovim modules:
  `sudo pip2 install --upgrade neovim`
  `sudo pip3 install --upgrade neovim`

* remove or backup your `~/.nvimrc` file and `~/.vim` directory

* bring down the github .vim archive
  `git clone https://github.com/vtavares00dev/vim-config.git ~/.vim`

* add the following to your ~/.config/nvim/init.vm file to use ~/.vim dir:
```
    set runtimepath+=~/.vim,~/.vim/after
    set packpath+=~/.vim
    source ~/.nvimrc
```

* symlink your .nvimrc to the nvimrc in the .vim directory
  `ln -s ~/.vim/nvimrc ~/.nvimrc`

* install the Meslo Nerd Font for Airline (Powerline) and vim-devicons plugins

* restore iTerm2 preferences file `com.googlecode.iterm2.plist` You may have to manually select the Meslo font and size in the iTerm2 preferences.

* start nvim. vim-plug should automatically download the first time and install all plugins. If it doesn't, or fails, you have to manually install pjunegunn/vim-plug.

* install/update all plugins from command line: `nvim +PlugUpdate! +qall` or,
    from neovim: `:PlugUpdate`

