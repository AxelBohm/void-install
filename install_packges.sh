


basic=(
    wget
    terminus-font
    # ttf-dejavu
    cmake
    gcc
    wpa_supplicant
    tmux
    alsa-utils          # sound
    encfs               # dropbox encryption
    pass
    acpi
    tlp                 # power management
    emacs-x11           # for gui goodness
    redshift
    hunspell
    hunspell-en_US
)

echo 'installing basics...'
sudo xbps-install ${basic[@]}


# to authenticate for mutt/neomutt
sudo xbps-install cyrus-sasl
sudo xbps-install cyrus-sasl-modules
sudo xbps-install cyrus-sasl-modules-gssapi


audio=(
    alsa-utils
    pulsaudio
    alsa-plugins-pulsaudio
    apulse
)

echo 'setting up audio...'
sudo xbps-install ${audio[@]}

echo 'xorg'
x=(
    xf86-video-intel    # intel driver (needed for screen brightness)
    xf86-input-evdev    # drivers for keyboard, trackpad, etc
    xinit
    xbacklight
    xterm
    xclip
    xorg-fonts
    xsetroot            # for dwm status bar
    setxkbmap           # so I can set keyboard to colemak in X
    hsetroot            # solid color background
)

echo 'suckless dependencies'
sl=(
    libX11-devel
    libXft-devel
    libXinerama-devel
    libXrandr-devel
)
sudo xbps-install ${sl[@]}

sxivdep=(
    imlib2-devel
    libexif-devel
    giflib-devel
)
sudo xbps-install ${sxivdep[@]}

echo 'compile suckless stuff'
make=(
    st
    dwm
    slock
    surf
    sxiv
)

for util in ${make[@]}
do
    git clone https://github.com/AxelBohm/$util.git /home/xel/src/$util
    cd /home/xel/src/$util
    sudo make clean install
done

# set default pdf viewer
xdg-mime default zathura.desktop application/pdf
