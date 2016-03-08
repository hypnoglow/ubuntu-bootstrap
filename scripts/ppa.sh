# NOTICE. This file does not meant to be executed directly.
#         It is part of the ubuntu-bootstrap script.

# Just to be sure this file is included from the right place.
declare -f -F interactive_ask > /dev/null
if [ $? -ne 0 ]; then
	echo "Internal error: interactive_ask() is not defined" >&2
	exit 1
fi

! interactive_ask "Install ppa packages?" && return 0

self_dir=$( dirname $( readlink -f ${BASH_SOURCE[0]} ) )

echo "Installing ppa packages"

packages=""

while read line || [ -n "$line" ] ; do
	[[ $line =~ ^# ]] && continue

	ppa=$( echo ${line%->*} )
	packages="$packages $( echo ${line#*->} )"

	cat /etc/apt/sources.list /etc/apt/sources.list.d/* | egrep -v 'list.save|deb-src' | grep -q deb.*$ppa
	if [ $? -ne 0 ] ; then
		sudo add-apt-repository ppa:${ppa}/ppa -y
	fi

done < $self_dir/ppa.list

if [ -z "$packages" ] ; then
	return 0
fi

sudo aptitude update
sudo aptitude install -y $packages
