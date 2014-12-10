APP_DIR=/app/dre/applications
TAR_DIR=/app/dreadmin/20141203

OLD_MODULE=viva-sdp-UdpGateway-2.0.2
NEW_MODULE=viva-sdp-UdpGateway-2.0.5

cd $APP_DIR
sudo -E -u jboss tar xvfz $TAR_DIR/$NEW_MODULE*
sudo -E -u jboss  mv $APP_DIR/$NEW_MODULE/bin/uat.env-var  $APP_DIR/$NEW_MODULE/bin/uat.env-var.20141203

sudo -E -u jboss  cp -p $APP_DIR/$OLD_MODULE/bin/uat.env-var  $APP_DIR/$NEW_MODULE/bin/
ls $APP_DIR/$NEW_MODULE/bin
