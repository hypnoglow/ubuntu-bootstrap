# System tweaks.
# All tweaks are tagged with #hypnoglow so you can grep them easily.

# Reduce swappiness
# To check swappiness use: $ cat /proc/sys/vm/swappiness
if ! grep -q vm.swappiness /etc/sysctl.conf ; then
	echo "Reducing swappiness..."
	echo -e "# Decrease swap usage to a more reasonable level (#hypnoglow)" | sudo tee -a /etc/sysctl.conf
	echo -e "vm.swappiness=5" | sudo tee -a /etc/sysctl.conf
	sudo sysctl -p
	echo "..ok"
fi

# Increase inotify
if ! grep -q fs.inotify.max_user_watches /etc/sysctl.conf ; then
	echo "Increasing inotify..."
	echo -e "# Increase inofity so apps (like dropbox and phpstorm) can watch tons of files (#hypnoglow)" | sudo tee -a /etc/sysctl.conf
	echo -e "fs.inotify.max_user_watches=131072" | sudo tee -a /etc/sysctl.conf
	sudo sysctl -p
	echo "..ok"
fi

# Disable avahi
# It will be disabled on further startups:
echo "manual" | sudo tee /etc/init/avahi-daemon.override
