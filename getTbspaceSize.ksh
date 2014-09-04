#!/usr/bin/ksh
################################################################################
#Author:Amadou Wane
#Date:09/21/09
#Copyright:PHNS CORP.
#Usage: 
#Purpose:
################################################################################
export LOGDIR=/home/oracle/log
export TODAY=`date +%m%d%y-%H%M%S`
export LOGFILE=/home/oracle/log/getTbspaceSize.$TODAY.log
export ORACLE_HOME=/u01/oracle/product/10.2.0.3/db
export SQLPLUS=$ORACLE_HOME/bin/sqlplus
export ORACLE_SID=cert1
export ORACLE_BASE=/u01/oracle/product
export HOME=/home/oracle
export TERM=xterm
export REPORT_DIR=/home/oracle/reports
. $HOME/.profile

echo "#######################################">>$LOGFILE
echo "StartTime: `date`" >>$LOGFILE
echo "#######################################">>$LOGFILE

$SQLPLUS '/ as sysdba' <<EOF |tee -a $LOGFILE
@/home/oracle/sql/tbSpaceSize.sql
EOF
cp $REPORT_DIR/tbSpaceSizeCurrent.rpt  $REPORT_DIR/tbSpaceSize.$TODAY.rpt
echo "#######################################">>$LOGFILE
echo "EndTime: `date`" >>$LOGFILE
echo "#######################################">>$LOGFILE
