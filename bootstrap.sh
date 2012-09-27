#!/usr/bin/env sh

endpath="$HOME/.spf13-tax-vim-3"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo "thanks for installing taxilian's fork of spf13-vim\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $file ] && mv $i $i.$today; done


echo "cloning spf13-vim\n"
git clone --recursive -b 3.0-new http://github.com/taxilian/spf13-vim.git $endpath
mkdir -p $endpath/.vim/bundle
ln -s $endpath/.vimrc $HOME/.vimrc
ln -s $endpath/.vimrc.bundles $HOME/.vimrc.bundles
ln -s $endpath/.vimrc.bundles.fork $HOME/.vimrc.bundles.fork
ln -s $endpath/.vimrc.fork $HOME/.vimrc.fork
ln -s $endpath/.vim $HOME/.vim

echo "Installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "installing plugins using Vundle"
vim -u $endpath/.vimrc.bundles - +BundleInstall! +BundleClean +qall
