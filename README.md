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

* remove or backup your `~/.vimrc` file and `~/.vim` directory
* bring down github archive
  `git clone https://github.com/vtavares00dev/vim-config.git ~/.vim`
  `ln -s ~/.vim/nvimrc ~/.vimrc`
* install plug: 
`curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
* install/update all plugins (using plug): `nvim +PlugInstall! +qall`
* install the Meslo Powerline font from `https://github.com/PaBLoX-CL/powerline-fonts`
    - I use the "Meslo LG M DZ Regular for Powerline" font
* start nvim and profit!

