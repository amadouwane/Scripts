#!/usr/bin/ksh
################################################################################
#Author:Amadou Wane
#Date:11/18/09
#Copyright:PHNS CORP.
#Usage: exportAdmin.ksh
#Purpose:Export Admin database
################################################################################
export LOGDIR=/home/oracle/log
export TODAY=`date +%m%d%y-%H%M%S`
export TODAY2=`date +%m%d%y`
export ORACLE_HOME=/u01/oracle/product/10.2.0.3/db
export LOGFILE=/home/oracle/log/exportAdmin.$TODAY.log
export EXP=$ORACLE_HOME/bin/exp
export ORACLE_SID=admin1
export ORACLE_BASE=/u01/oracle/product
export HOME=/home/oracle
export PARFILE=/tmp/admin1.par
export TZ=EST5EDT

echo "#######################################">>$LOGFILE
echo "StartTime: `date`" >>$LOGFILE
echo "#######################################">>$LOGFILE
#CREATE PARFILE
echo "USERID=system/manager@admin1">$PARFILE
echo "FILE=/orastage/admin/Admin1.$TODAY2.dmp">>$PARFILE
echo "FULL=Y">>$PARFILE
#echo "ROWS=N">>$PARFILE
echo "LOG=$LOGFILE">>$PARFILE
echo "FEEDBACK=5000">>$PARFILE
echo "STATISTICS=NONE">>$PARFILE

#START EXPORT
$EXP parfile=$PARFILE

echo "#######################################">>$LOGFILE
echo "EndTime: `date`" >>$LOGFILE
echo "#######################################">>$LOGFILE
