#!/bin/zsh

DEST="${ZDOTDIR:-$HOME}/.home"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^(README.md|zshrc|zpreztorc)(.N); do
  echo $rcfile
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s "$DEST/zshrc" "${ZDOTDIR:-$HOME}/.zshrc"
ln -s "$DEST/zpreztorc" "${ZDOTDIR:-$HOME}/.zpreztorc"
ln -s "$DEST/vimrc" "${ZDOTDIR:-$HOME}/.vimrc"
#ln -s "$DEST/emacs.d" "${ZDOTDIR:-$HOME}/.emacs.d"

echo "done"
echo
echo "Now run 'chsh -s' to change your used shell to activate settings"
