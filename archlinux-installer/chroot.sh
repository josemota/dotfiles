#
# Post installation
#

export USER=$1
export PASS=$2
export HOST=$3
export DOTFILES=$4
export LANG=$5
export TIMEZONE=$6

echo "\e[33m=== Starting post installation...\e[39m"
ln -sf /usr/share/zoneinfo/$6 /etc/localtime
hwclock --systohc
echo "LANG=$LANG" > /etc/locale.conf
echo "$LANG UTF-8" >> /etc/locale.gen
locale-gen
echo $HOST > /etc/hostname
mkinitcpio -P
echo 'root:'$PASS | chpasswd
pacman -S --noconfirm grub
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "\e[36m=== Post installation successful.\e[39m"

#
# Bootstrap
#

echo -e "\e[33m=== Bootstrapping...\e[39m"

pacman -Syy
pacman -S --noconfirm curl \
                      dhcpcd \
                      emacs \
                      git \
                      go \
                      lightdm \
                      lightdm-gtk-greeter \
                      i3-gaps \
                      ncdu \
                      openssh \
                      ranger \
                      ripgrep \
                      rxvt-unicode \
                      stow \
                      sudo \
                      ttf-roboto \
                      ttf-roboto-mono \
                      tmux \
                      vi \
                      vim \
                      virtualbox-guest-modules-arch \
                      virtualbox-guest-utils \
                      wget \
                      xf86-video-vmware \
                      xsel \
                      zip \
                      zsh

systemctl enable dhcpcd
systemctl enable vboxservice
systemctl enable lightdm

useradd -m -G wheel,vboxsf -s /bin/zsh -p $PASS $USER

echo "%wheel      ALL=(ALL) ALL" >> /etc/sudoers
echo "autologin-user=$USER" >> /etc/lightdm/lightdm.conf

echo -e "\e[36m=== Bootstrap complete.\e[39m"
