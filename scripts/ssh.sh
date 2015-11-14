if [ -e ~/.ssh/id_rsa.pub ] ; then
    return 0
fi

ssh-keygen -t rsa -C "$USER@$HOSTNAME"