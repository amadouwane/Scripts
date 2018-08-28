for MYHOST in `cat mylist.lst`
do
ssh me@$MYHOST  "mkdir -p .ssh;chmod 700 .ssh;touch .ssh/authorized_keys;chmod 640 .ssh/authorized_keys"
cat id_rsa.pub |ssh me@$MYHOST 'cat >> .ssh/authorized_keys'
done
