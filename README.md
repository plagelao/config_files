INSTALLATION
------------

Update the submodules first

        git submodule update --init

Then link up as many files as you want to use...

        ln -sf vimrc ~/.vimrc
        ln -sf vim ~/.vim
        ln -sf gitconfig ~/.gitconfig

Then, launch Vim and run

        :BundleInstall

to install the plugins :D
