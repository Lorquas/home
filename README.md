Notes
====

Clone the repo into your home dir:

 $ cd; git clone git@github.com:Lorquas/home.git .home
 
Go to the new git dir and run make install:

 $ cd $HOME/.home && make install
 
.home will then clone the oh-my-zsh repository (if necessary) and create a symlink in your home dir .zshrc to adjust $PATH as well as set zsh preferences.

