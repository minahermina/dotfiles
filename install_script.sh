#!/bin/bash
:<<'TODO'

TODO






echo "Authored by "
echo "███╗   ███╗██╗███╗  ██╗ █████╗"
echo "████╗ ████║██║████╗ ██║██╔══██╗"
echo "██╔████╔██║██║██╔██╗██║███████║"
echo "██║╚██╔╝██║██║██║╚████║██╔══██║"
echo "██║ ╚═╝ ██║██║██║ ╚███║██║  ██║"

echo 
echo 
echo 
echo "###################################################################################################################################################"
echo "##                                                                                                                                               ##"
echo "## Be careful, this script does not back up the configs on your system. Please back up your data and read the entire script before executing it. ##"
echo "##                                                                                                                                               ##"
echo "###################################################################################################################################################"
echo 
echo 
echo 

# Constants
DOTFILES_PARENT="$HOME/repos"
DOTFILES_PATH="$DOTFILES_PARENT/dotfiles"
DOTFILES_URL="https://github.com/minaalbertsaeed/dotfiles.git"

#------------------------------------------------------------------ 
if [ ! -d "$DOTFILES_PARENT" ]; then
    echo "--> Directory $DOTFILES_PARENT does not exist."
    echo "--> Creating directory: $DOTFILES_PARENT"

    echo "--> Executing: mkdir "$DOTFILES_PARENT""
    mkdir "$DOTFILES_PARENT"

    if [ $? -eq 0 ]; then
        echo "--> Successfully created $DOTFILES_PARENT."
    else
        echo "--> Failed to create $DOTFILES_PARENT. Please check permissions."
        exit 1
    fi
else
    echo "--> Directory $DOTFILES_PARENT already exists. Skipping creation."
fi
#------------------------------------------------------------------ 

# Downloading the dotfiles
echo "--> Executing: rm -rf  $DOTFILES_PATH... "
rm -rf $DOTFILES_PATH
echo "--> Cloning my dotfiles repo to $DOTFILES_PATH... "
echo "--> Executing: git clone --depth=1 $DOTFILES_URL $DOTFILES_PATH"
git clone --depth=1 $DOTFILES_URL $DOTFILES_PATH

# Installing TPM for tmux 
echo "--> Executing: git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# System packages
echo "--> Installing system packages"
echo "--> executing sudo pacman -S -needed - < $DOTFILES_PATH/.local/pkglist.txt"
sudo pacman -S --needed - < $DOTFILES_PATH/.local/share/pkglist.txt


# doas config
doas_config_content="permit nopass :wheel"
echo "--> Configuring doas (Fuck sudo)"
echo -e "--> Executing: \nsudo echo \"$doas_config_content\" > /etc/doas.conf"
sudo echo "$doas_config_content" | sudo tee /etc/doas.conf
echo  "Removing sudo.... "
echo "--> Executing: doas pacman -S sudo"
doas pacman -S sudo

# Linking config files and dirs to the system
link_dotfiles_script="$DOTFILES_PATH/.local/scripts/link_dotfiles.sh"
echo "--> Linking the actual config files and dirs"
echo "--> Executing: $link_dotfiles_script"
$link_dotfiles_script

# Building suckless tools
suckless_programs=("dwm" "dwmblocks" "dmenu" "st" "slock")
for program in "${suckless_programs[@]}"; do
    echo "$DOTFILES_PATH/src/$program"
    cd "$DOTFILES_PATH/src/$program" 
    echo "-------------------------------------"
    echo "--> Compiling & installing $program"
    echo "--> Executing: doas make install clean"
    echo "-------------------------------------"
    doas make install clean
done

# Yay 
echo "Installing Yay (Yet another Yougurt)"
echo "--> Executing: git clone https://aur.archlinux.org/yay.git $HOME/yay"
git clone https://aur.archlinux.org/yay.git "$HOME/yay"
echo "--> Executing: cd yay"
cd yay
echo "--> Executing: makepkg -si"
makepkg -si
echo "--> Removing $HOME/yay/ .... "
echo "--> Executing: rm -rf $HOME/yay/ .... "
rm -rf "$HOME/yay"

# AUR Packages
echo "Installing AUR Packages from $HOME/.local/share/foreign_pkglist.txt"
echo "--> Executing: yay -S --needed - < $HOME/.local/share/foreign_pkglist.txt .... "
yay -S --needed - < $HOME/.local/share/foreign_pkglist.txt 
echo "--> Executing: yay -Runcs $(yay -Qqdt)... "


