#!/bin/bash

#Author: Chirag Sorathiya
#Agenda: This script is about to update the TB Publish  on QA server

################# Variables #########################
password="cimcon@123"
Today="$(date +'%d_%m_%Y')"
Publish_Path='/usr/sbin/CS_Automation/Publish/'
Publish_Backup_Path='/usr/sbin/CS_Automation/Publish/Publish_backup'
netcore_path='/var/netcore/'
backup='publish_'$Today.'zip'
Test_Path='/home/thingsboard/test/'


######################## Setting the debug #####################################
set -e

######################## Taking netcore backup #################################
netcore_backup() {

	echo "========== Taking netcore backup ============="
	cd $Publish_Backup_Path
	echo "$password" | sudo -S cp -r $netcore_path . 
	echo "$password" | sudo -S tar -zcf $backup netcore
}

############################### Deploying netcore #################################

deploy_netcore() {
	echo "============= Deploying Netcore =============="

	echo "$Password" | sudo -S systemctl stop AnomalyDetection.service
	echo "$password" | sudo -S cp -r $Publish_Path/Published/* $netcore_path
	echo "$password" | sudo -S rm -rf $Publish_Backup_Path/netcore
}


############################### Restaring the service ###############################
service_restart() {
	echo "========== Restarting the service ==========="

	echo "$Password" | sudo -S chmod -R 777 /var/netcore/wwwroot/ExportToExcel/
	echo "$Password" | sudo -S systemctl restart AnomalyDetection.service
}

############################## calling the function ###################################
netcore_backup
deploy_netcore
service_restart

echo "Thingsboard Published deployed successfully...!!!"

################################# End of the Script ####################################
