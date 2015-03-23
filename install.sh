#! /bin/zsh

# Get the directory that this script is stored in
SDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Link ZSH runcom files
ln -s SDIR/home/.zprezto $HOME
etopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Run Murphy's prefferred os x settings
if [[ "$OSTYPE" == "darwin"* ]]; then
  source $SDIR/osx-settings.sh
fi
