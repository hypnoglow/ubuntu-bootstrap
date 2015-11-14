if [ "`sudo dmidecode -s system-product-name`"  != "VirtualBox" ] ; then
	echo "WARNING! Seems that this is NOT a guest VirtualBox system."
fi

echo "Do you want to install VirtualBox guest additions?"

while [ "$answer" != "y" ] && [ "$answer" != "n" ] ; do
	echo -n "Please answer 'y' or 'n': "
	read answer
done

if [ "$answer" = "n" ] ; then
	return 0
fi

sudo aptitude install virtualbox-guest-additions virtualbox-guest-dkms virtualbox-guest-x11 virtualbox-guest-utils