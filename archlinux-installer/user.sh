#
# User bootstrap
#

export $DOTFILES = ${1:-http://github.com/josemotanet/dotfiles}

echo -e "\e[34m=== Bootstrapping user...\e[39m"

echo -e "\e[34m=== Installing yay...\e[39m"

wget -O PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay
makepkg -si --noconfirm
sudo pacman -U *.tar.xz --noconfirm
rm -v PKGBUILD *.tar.gz *.tar.xz

echo -e "\e[36m=== Yay installed.\e[39m"

yay -S --noconfirm ttf-iosevka \
                   polybar

ssh-keygen -N "" -t rsa -f ~/.ssh/id_rsa
mkdir -vp workspace && cd workspace
git clone $DOTFILES dotfiles
cd dotfiles/stow

for PACKAGE in shell xorg git vim emacs tmux polybar rofi i3 dunst
do
  stow -R -v -t ~ package
done

echo -e "\e[36m=== User bootstrapped.\e[39m"
