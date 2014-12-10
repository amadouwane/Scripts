export MODULE1=viva-sdp-UdpGateway-2.0.5

cd /app/dre/applications/$MODULE1/bin
sudo -E -u jboss ./upd-env uat.env-var
sleep 15
tail /app/logs/server.log
#--------------------------------------------------
export MODULE2=viva-sdp-core-2.01.9

cd /app/dre/applications/$MODULE2/bin
sudo -E -u jboss ./upd-env uat.env-var
sleep 15
tail /app/logs/server.log
#--------------------------------------------------

export MODULE3=viva-NonPrefNetworkNotif-2.0.4

cd /app/dre/applications/$MODULE3/bin
sudo -E -u jboss ./upd-env uat.env-var
sleep 15
tail /app/logs/server.log
