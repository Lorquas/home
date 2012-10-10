#!/bin/zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  echo $rcfile
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
