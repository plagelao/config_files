INSTALLATION
------------

Update the submodules first

        git submodule update --init

Then link up as many files as you want to use...

        ln -sf vimrc ~/.vimrc
        ln -sf vim ~/.vim
        ln -sf gitconfig ~/.gitconfig
        ln -sf zshrc ~/.zshrc
        ln -sf zsh_prompt ~/.prompt
        ln -sf tmux.conf ~/.tmux.conf

Then, launch Vim and run

        :BundleInstall

to install the plugins :D
