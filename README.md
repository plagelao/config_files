INSTALLATION
------------

Update the submodules first

        git submodule update --init

Then link up as many files as you want to use...

        cd ~
        ln -sf config_files/vimrc ~/.vimrc
        ln -sf config_files/vim ~/.vim
        ln -sf config_files/gvimrc ~/.gvimrc
        ln -sf config_files/ackrc ~/.ackrc

Then, launch Vim and run

        :BundleInstall

to install the plugins :D
