# NOTICE. This file does not meant to be executed directly.
#         It is part of the ubuntu-bootstrap script.

# Just to be sure this file is included from the right place.
declare -f -F interactive_ask > /dev/null
if [ $? -ne 0 ]; then
	echo "Internal error: interactive_ask() is not defined" >&2
	exit 1
fi

install_font_hack() {
    # Check if already installed
    [ -e "/usr/share/fonts/truetype/hack" ] && return 0

    ! interactive_ask "Install fonts?" && return 0
    echo "Installing font \"hack\""

    cd /tmp
    wget https://github.com/chrissimpkins/Hack/releases/download/v2.019/Hack-v2_019-ttf.zip
    sudo unzip Hack-v2_019-ttf.zip -d /usr/share/fonts/truetype/hack
    rm Hack-v2_019-ttf.zip
    cd
}

install_font_hack
