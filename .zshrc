#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the path to Oh My Zsh.
export OMZ="$HOME/.oh-my-zsh"

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
zstyle ':omz:load' omodule 'environment' 'terminal' 'editor' 'completion' \
  'history' 'directory' 'spectrum' 'alias' 'utility' 'prompt' 'git'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
#zstyle ':omz:module:prompt' theme 'steeef'
#zstyle ':omz:module:prompt' theme 'sorin'
zstyle ':omz:module:prompt' theme 'jmolet'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

# Customize to your needs...
#Aliases
##ping
alias p='ping'
alias po='ping -c 3 -w 3 4.2.2.2'
alias pi='ping -c 3 -w 3 172.16.52.28'
alias pg='ping www.google.com'

#ls
alias l='ls -l'
alias la='ls -al'
alias ll='ls -l --color=tty'
alias ls='ls --color=tty'
alias lf='ls -F --color=tty'

#basic commands
#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -i'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias pcat='pygmentize'

#coding commands
alias lein-rebuild='echo "+ lein clean";lein clean;echo "+ lein deps"; lein deps;echo "+ lein compile"; lein compile'
alias git-pull='git checkout master && git pull upstream && git push origin master && git checkout sm-clj && git rebase master'
alias git-push='git push origin sm-clj:master'
alias git-push-upstream='git checkout master && git merge sm-clj && git push upstream master && git push origin master && git checkout sm-clj'

#ssh commands
alias ssh-remove='ssh-add -D'
alias ssh_add_rh='ssh-add -D; ssh-add ~/.ssh/id_rsa' #~/rhdr/rhdr-2010-07-22 ~/rhdr/rhdr-2010-04-01 ~/rhdr/rhdr-2009-11-13 ~/rhdr/rhdr-2009-07-20 ~/rhdr/rhdr-2009-02-23 ~/rhdr/rhdr-2008-09-08 ~/rhdr/rhdr-2008-06-27 ~/rhdr/rhdr-2008-03-11 ~/rhdr/rhdr-2007-10-08 ~/rhdr/rhdr-2007-05-25 ~/rhdr/rhdr-2007-05-03 ~/rhdr/rhdr-2007-07-17'

alias fart='echo I think I pooed a little...'

#remote servers
alias sshlss='ssh -XYC Lorquas@tirpitz.kicks-ass.org'
alias sshncsu='ssh -XYC jcmolet@remote-linux.eos.ncsu.edu'

alias x2112='ssh -XYC jmolet@x2112.usersys.redhat.com'
alias xanadu='ssh -XYC jmolet@xanadu.usersys.redhat.com'
alias jmolet='ssh -XYC jmolet@jmolet.usersys.redhat.com'

alias mgmt1='ssh -XYC root@mgmt1.rhq.lab.eng.bos.redhat.com'
alias mgmt1-console='console -M console.lab.bos.redhat.com mgmt1.rhq.lab.eng.bos.redhat.com'
alias mgmt4='ssh -XYC root@mgmt4.rhq.lab.eng.bos.redhat.com'
alias mgmt4-console='console -M console.lab.bos.redhat.com mgmt4.rhq.lab.eng.bos.redhat.com'
alias mgmt5='ssh -XYC root@mgmt5.rhq.lab.eng.bos.redhat.com'
alias mgmt5-console='console -M console.lab.bos.redhat.com mgmt5.rhq.lab.eng.bos.redhat.com'
alias qeblade4='rssh qeblade4.rhq.lab.eng.bos.redhat.com'
alias qeblade25='rssh qeblade25.rhq.lab.eng.bos.redhat.com'

alias jmolet-vm1='rssh jmolet-vm1'
alias jmolet-vm1-vnc='vncviewer jmolet-vm1.usersys.redhat.com:2 --DesktopSize=1280x1024'
alias jmolet-vm1-console='console-connect xanadu.usersys.redhat.com jmolet-vm1'

alias jmolet-vm2='rssh jmolet-vm2'
alias jmolet-vm2-vnc='vncviewer jmolet-vm2.usersys.redhat.com:2 --DesktopSize=1280x1024'
alias jmolet-vm2-console='console-connect xanadu.usersys.redhat.com jmolet-vm2'

alias jmolet-vm3='rssh jmolet-vm3'
alias jmolet-vm3-vnc='vncviewer jmolet-vm3.usersys.redhat.com:2 --DesktopSize=1280x1024'
alias jmolet-vm3-console='console-connect xanadu.usersys.redhat.com jmolet-vm3'

alias jmolet-vm4='rssh jmolet-vm4'
alias jmolet-vm4-vnc='vncviewer jmolet-vm4.usersys.redhat.com:2 --DesktopSize=1280x1024'
alias jmolet-vm4-console='console-connect xanadu.usersys.redhat.com jmolet-vm4'

alias jmolet-vm0='rssh jmolet-vm0'
alias jmolet-vm0-vnc='vncviewer jmolet-vm0.usersys.redhat.com:2 --DesktopSize=1280x1024'
alias jmolet-vm0-console='console-connect xanadu.usersys.redhat.com jmolet-vm0'

alias jmolet-5server='rssh jmolet-5server'
alias jmolet-5server-console='console-connect xanadu.usersys.redhat.com jmolet-5server'

alias jmolet-cp0='rssh jmolet-cp0'
