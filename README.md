# Vim Open

> Quick open any url in the current line

## Installation

This plugin was built on mac and has only been tested with mac for now. However, assuming your vim was included with python 2.7, you shouldn't have any problems. No external python modules are required.

~~~ vim
" vimrc
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'jonmorehouse/vim-open'
~~~

~~~ sh
# homebrew vim comes with python 
$ brew install vim 

# install all vundle plugins
vim +PluginInstall +qall

~~~
## Usage 

From within vim, easily open any url in your current line.

~~~ markdown
# some-file.txt

* Go checkout [vimhub](https://github.com/jonmorehouse/vimhub)
* https://github.com/jonmorehouse/vimhub
~~~

~~~ save
:VimOpen
~~~


