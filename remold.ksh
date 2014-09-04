#!/usr/bin/ksh
################################################################################
#Author:Amadou Wane
#Date:08/20/09
#Copyright:PHNS CORP.
#Usage: remold.ksh
#Purpose:Remove old logs. Runs daily via cron.
################################################################################
######
#PROD
######

#Remove trace files that are older than 30 days
find /u02/oracle/admin/prod/udump/prod1 -name "*.trc" -ctime +30 -exec rm {} \;
find /u02/oracle/admin/prod/bdump/prod1 -name "*.trc" -ctime +30 -exec rm {} \;

#Remove log files that are older than 30 days
find /u02/oracle/admin/rman/scripts/PROD/ -name "*.log" -ctime +30 -exec rm {} \;
find /u02/oracle/admin/rman/scripts/PROD/ -name "*.sql" -ctime +30 -exec rm {} \;
find /u02/oracle/admin/rman/scripts/PROD/ -name "*.error" -ctime +30 -exec rm {} \;

#Remove error files that are older than 30 days
find /u02/oracle/admin/rman/scripts/PROD/ -name "*.error" -ctime +30 -exec rm {} \;

#Remove temporary SQL  files that are older than 30 days
find /u02/oracle/admin/rman/scripts/PROD/ -name "*.sql" -ctime +30 -exec rm {} \;

#Remove trace files that are older than 10 days
find /u02/oracle/admin/prod/bdump/prod1 -name "*.trc" -ctime +10 -exec rm {} \;

#Remove older controlfile backup
find /u01/oracle/product/10.2.0.3/db/dbs -name "c-*" -ctime +2 -exec rm {} \;

#Remove older RMAN logs
find /atg/rman/version5_0/PROD -name "rman_backup_database_*" -ctime +30 -exec rm {} \;
#-------------------------------------------------------------------------------
#######
#ADMIN
#######
#Remove log files that are older than 30 days
find /u02/oracle/admin/rman/scripts/ADMIN/ -name "*.log" -ctime +30 -exec rm {} \;
#Remove error files that are older than 30 days
find /u02/oracle/admin/rman/scripts/ADMIN/ -name "*.error" -ctime +30 -exec rm {} \;

#Remove temporary SQL  files that are older than 30 days
find /u02/oracle/admin/rman/scripts/ADMIN/ -name "*.sql" -ctime +30 -exec rm {} \;
