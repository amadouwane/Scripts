export TRACE_DIR=/gproxy/traces
export HOST=`hostname`
export DISK_UTIL=`df|grep traces|awk '{ print $4 }'|sed 's/%//'`


/bin/gzip $TRACE_DIR/${HOST}_gtp.pcap*

/usr/bin/find /gproxy/traces -maxdepth 1 -name "${HOST}_gtp.pcap*.gz" -type f -mtime +15 -exec mv -t /gproxy/traces/archive {} +


if [ $DISK_UTIL -gt 80 ]
then
/usr/bin/find /gproxy/traces/archive -maxdepth 1 -type f -mtime +360 -exec rm {} +
fi


