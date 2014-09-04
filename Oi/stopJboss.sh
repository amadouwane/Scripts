#!/bin/bash
################################################################################
#Date:09/04/2014
#Author: Amadou Wane
#Copyright: 
#Usage:stopJboss.sh
#Purpose: JBOSS Stop Script
################################################################################
export NOW=$(date +"%m%d%Y%H%M")
export JBOSS_HOME=/home/JBOSS/jboss-5.1.0.GA
export JBOSS_LOG=$JBOSS_HOME/server/default/log
export JBIN=$JBOSS_HOME/bin
export KILL=/bin/kill
export JSTACK=/home/JAVA/jdk1.6.0_23/bin/jstack
export NETSTAT=/bin/netstat
export JWORK=$JBOSS_HOME/server/default/work
export JTMP=$JBOSS_HOME/server/default/tmp
export DEPLOY_DIR=$JBOSS_HOME/server/default/deploy
export DRE_LOG=/home/dredev/logs
export JBOSS_PID=`pgrep -lf java | grep jboss |grep run.sh | cut -d' ' -f1`

if [ $JBOSS_PID ]
then
  echo "Capturing netstat and jstack outputs in ~/logs..."
  $JSTACK ${JBOSS_PID}  > $DRE_LOG/jstack.$NOW;sleep 3
  $NETSTAT -an > $DRE_LOG/netstat_$NOW;sleep 3
  echo "Killing JBoss with PID="${JBOSS_PID}... ;sleep 3
  $KILL -9 $JBOSS_PID;sleep 5
  echo "Done stopping JBOSS..."
else
  echo "There is no running Jboss to stop..."
fi
