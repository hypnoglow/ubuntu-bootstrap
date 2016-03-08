# NOTICE. This file does not meant to be executed directly.
#         It is part of the ubuntu-bootstrap script.

# Just to be sure this file is included from the right place.
declare -f -F interactive_ask > /dev/null
if [ $? -ne 0 ]; then
	echo "Internal error: interactive_ask() is not defined" >&2
	exit 1
fi

install_redis() {
	cd /tmp
	wget http://download.redis.io/redis-stable.tar.gz
	tar xzf redis-stable.tar.gz
	# TODO: move to some location
	cd redis-stable
	make
}

# This actually installs nothing yet.
