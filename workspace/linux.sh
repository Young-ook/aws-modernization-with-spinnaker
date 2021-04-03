# workspace setup tool for linux
# Requirements
# - GCC 4.7.0 or newer
# - Linux 2.6.32 or newer
# - Glibc 2.13 or newer
# - 64-bit x86_64 CPU
#
# Redhat, Fedora:
#  sudo yum groupinstall 'Development Tools'
#  sudo yum install curl file git
# Debian, Ubuntu:
#  sudo apt-get install build-essential curl file git
#
#!/bin/bash -ex

BREW_HOME=$HOME/.linuxbrew

[ -d $BREW_HOME ] && rm -rf $BREW_HOME
git clone https://github.com/Homebrew/brew $BREW_HOME

[ ! -d $HOME/.local/bin ] && mkdir -p $HOME/.local/bin
ln -s $BREW_HOME/bin/brew $HOME/.local/bin/brew

brew install awscli jq kubernetes-cli tfenv

tfenv install 0.13.5
tfenv use 0.13.5
