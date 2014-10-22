
VIM config
##########

A saved vim configuration with Vundle.

Install
#######

ln -s path/to/this/dir ~/.vim

Additional Setup
################

ack
---
- Install ack on system

base16
------
- For dark schemes ensure set background=dark is present in your ~/.vimrc file
- Add colorscheme base16-default to your ~/.vimrc

tagbar
------
https://github.com/majutsushi/tagbar
- Install exuberant ctags 5.5

tern_for_vim
------------
- Run npm install in the bundle/tern_for_vim directory

youcompleteme
-------------
https://github.com/Valloric/YouCompleteMe
```bash
sudo apt-get install build-essential cmake
sudo apt-get install python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```
