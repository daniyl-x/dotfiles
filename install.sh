#! /bin/bash

# Print out message dependent on result of last command
check_last_status(){
    [ $? -eq 0 ] && echo "Success :)" || echo "Fail :("
}

# Vim update plugins in background
update_vim_plug(){
 printf "Vim-Plug: Updating plugins...\n"
 vim +PlugInstall +q! +q! > /dev/null 2>&1
 check_last_status
}


printf "Copying files...\n\n"

printf "\n.bashrc & .vimrc...\n"
cp .*rc ~/
check_last_status

printf "\n.gitignore-global...\n"
cp .gitignore-global ~/
check_last_status

printf "\nmicro...\n"
mkdir -p ~/.config/micro/
cp micro/* ~/.config/micro/
check_last_status


printf "\nApplying changes...\n\n"

printf "\n.bashrc...\n"
source ~/.bashrc
check_last_status

printf "\n.gitignore-global...\n"
git config --global core.excludesfile ~/.gitignore-global
check_last_status

printf "\n.vimrc...\n"
update_vim_plug

printf "\n\nDone!\n"
