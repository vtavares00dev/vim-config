# Victor Tavares' Vim Configuration

To install from scratch:

* remove or backup your `~/.vimrc` file and `~/.vim` directory
* `git clone https://github.com/vtavares00dev/vim-config.git ~/.vim`
* `ln -s ~/.vim/vimrc ~/.vimrc`
* install vundle: 
  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* install/update all bundles (using vundle): `vim +PluginInstall! +qall`
* configure YouCompleteMe:
    - `cd ~/.vim/bundle/YouCompleteMe`
    - `./install.sh --clang-completer`
* install the Meslo Powerline font from `https://github.com/PaBLoX-CL/powerline-fonts`
    - I use the "Meslo LG M DZ Regular for Powerline" font
* start vim and profit!

