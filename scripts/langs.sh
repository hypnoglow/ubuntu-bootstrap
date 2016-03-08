# NOTICE. This file does not meant to be executed directly.
#         It is part of the ubuntu-bootstrap script.

# Just to be sure this file is included from the right place.
declare -f -F interactive_ask > /dev/null
if [ $? -ne 0 ]; then
	echo "Internal error: interactive_ask() is not defined" >&2
	exit 1
fi

install_golang() {
	if which go > /dev/null; then
		return 0
	fi

	! interactive_ask "Install golang?" && return 0
	echo "Installing golang"

	local GOLANG_VERSION="1.5.1"
	local GOLANG_OS="linux"
	local GOLANG_ARCH="amd64"
	local GOLANG_TAR=go${GOLANG_VERSION}.${GOLANG_OS}-${GOLANG_ARCH}.tar.gz

	cd /tmp
	wget https://storage.googleapis.com/golang/${GOLANG_TAR}
	sudo tar -C /usr/local -xzf ${GOLANG_TAR}
	rm ${GOLANG_TAR}
	cd
}

install_rust() {
	if which rustc > /dev/null; then
		return 0
	fi

	! interactive_ask "Install rust-lang?" && return 0
	echo "Installing rust-lang"

	curl -sSf https://static.rust-lang.org/rustup.sh | sh
}

install_node() {
	if which node > /dev/null; then
		return 0
	fi

	! interactive_ask "Install node.js?" && return 0
	echo "Installing node.js"

    curl -L http://git.io/n-install | N_PREFIX=~/util/n bash -s -- -n
}

install_golang
install_rust
install_node
