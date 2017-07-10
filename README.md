# Victor Tavares' neovim Configuration

To install from scratch:

* install neovim and Python (if needed) with homebrew
  `brew install python`
  `brew install python3`
  `brew install neovim`

* install pip via easy_install:
  `sudo easy_install pip`

* pip install neovim modules
  `sudo pip install neovim`
  `sudo pip3 install neovim`

* remove or backup your `~/.nvimrc` file and `~/.vim` directory
* bring down github archive
  `git clone https://github.com/vtavares00dev/vim-config.git ~/.vim`
  `ln -s ~/.vim/nvimrc ~/.nvimrc`
* install plug:
  `curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
* install/update all plugins (using plug): `nvim +PlugInstall! +qall`

* install the Nerd Fonts for vim-devicons plugin (command all in one line)

  `cd ~/Library/Fonts && curl -fLo "Meslo LG M DZ Regular for Powerline Nerd Font Complete.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/M-DZ/complete/Meslo%20LG%20M%20DZ%20Regular%20for%20Powerline%20Nerd%20Font%20Complete.otf`

* restore iTerm2 preferences file `com.googlecode.iterm2.plist`
* start nvim and profit!

