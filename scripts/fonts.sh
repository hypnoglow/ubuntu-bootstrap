install_font_hack() {
    # Check if already installed
    [ -e "/usr/share/fonts/truetype/hack" ] && return 0

    cd /tmp
    wget https://github.com/chrissimpkins/Hack/releases/download/v2.019/Hack-v2_019-ttf.zip
    sudo unzip Hack-v2_019-ttf.zip -d /usr/share/fonts/truetype/hack
    rm Hack-v2_019-ttf.zip
    cd
}

install_font_hack
