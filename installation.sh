#!/bin/bash


echo -e "This script will configure dotfiles for: \n\
    zsh with zim (and nice prompt), \n\
    bash (only aliases), \n\
    vim with plugins, \n\
    tmux (compatible with vim). "

echo

# backup current dotfiles
while read -p "Make backup of dotfiles (zshrc, bashrc, vimrc, .vim folder, tmux.conf) (y/n)? " yn;
do
    case $yn in
        t|T|tak|Tak|y|Y|yes|Yes) 
            for file in ".zshrc" ".bashrc" ".vimrc" ".vim" ".tmux.conf" ".zimrc" ".zim";
            do
                BACKUP_DIR="$HOME/.backup-dotfiles"
                mkdir -p $BACKUP_DIR &&  test -f "$HOME/$file" && mv "$HOME/$file" "$BACKUP_DIR/$file"
            done
            echo "Backup done. Path: $BACKUP_DIR "
            break;;
        n|N|nie|Nie|no|No) 
            echo "Dotfiles will be overriten";
            break;;
    esac
done

# removing dotfiles
for file in ".zshrc" ".bashrc" ".vimrc" ".vim" ".tmux.conf" ".zimrc" ".zim";
do
    rm -rf $HOME/$file;
done

# linking configuration
for file in "zshrc" "bashrc" "vimrc" "tmux.conf" "zimrc";
do
    echo "source ~/.dotfiles/$file" > $HOME/.$file;
done

# ----------------------------------
# installing programs
#-----------------------------------
# PROGRAMS_TO_INSTALL=""
# if [ command -v fasd &> /dev/null  ];
# then 
#     PROGRAMS_TO_INSTALL+="fasd "
# elif [ command -v zsh &> /dev/null ];
# then
#     PROGRAMS_TO_INSTALL+="zsh ";
# elif [ command -v  borg &> /dev/null ];
#     PROGRAMS_TO_INSTALL+="borg "
#     # Autocomplition for borg
#     # https://github.com/mrkmg/borgbackup-zsh-completion
# then


# check for exsistens of program fasd
if [ command -v fasd &> /dev/null  ];
then
    # echo "Do you want fo install fasd? (y/n)"
    while read -p "Do you want fo install fasd? (y/n) " yn ;
    do
        case $yn in
        t|T|tak|Tak|y|Y|yes|Yes) 
            echo "Installing fasd";
            sudo pacman -S fasd;
            break;;
        n|N|nie|Nie|no|No) 
            echo "Not installing";
            echo "There will be problems with bashrc and zshrc. Edit them manually";
            break;;
        # *)
        #     [ -z yn ] &&  echo "Invalid argument";;
        esac
    done
else
    echo "Program fasd is installed"
fi

echo

echo "Installing vundle and other vim plugins..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &>/dev/null
vim +PluginInstall +qall

echo "Installing zsh"
if [ command -v zsh &> /dev/null  ];
then
    sudo pacman -S zsh
    echo "Installing zim..."
else
    echo "zsh is installed"
fi

echo "Instaling zim..."
git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim >/dev/null
echo "Change default shell to zsh"
chsh -s /bin/zsh
