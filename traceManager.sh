export TRACE_DIR=/gproxy/traces
export HOST=`hostname`

/bin/gzip $TRACE_DIR/${HOST}_gtp.pcap*

/usr/bin/find /gproxy/traces -maxdepth 1 -name "${HOST}_gtp.pcap*.gz" -type f -mtime +15 -exec mv -t /gproxy/traces/archive {} +
