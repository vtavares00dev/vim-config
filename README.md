# Victor Tavares' Vim Configuration

To install from scratch:

* remove or backup your `~/.vimrc` file and `~/.vim` directory
* `git clone https://github.com/vtavares00dev/vim-config.git ~/.vim`
* `ln ~/.vim/vimrc ~/.vimrc`
* install vundle: 
  `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* install/update all bundles (using vundle): `vim +PluginInstall! +qall`
* configure YouCompleteMe:
    - `cd ~/.vim/bundle/YouCompleteMe`
    - `./install.sh --clang-completer`
* start vim and profit!

