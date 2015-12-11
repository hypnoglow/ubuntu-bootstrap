install_golang() {
	if which go > /dev/null; then
		return 0
	fi

	echo "Installing go-lang"

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

	echo "Installing rust-lang"

	curl -sSf https://static.rust-lang.org/rustup.sh | sh
}


install_golang
install_rust

