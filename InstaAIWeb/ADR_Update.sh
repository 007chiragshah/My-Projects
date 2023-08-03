#!/bin/bash

#Author = Chirag Sorathiya
#Agenda = This Script will take a backup and update the ADR service

pass='cimcon@123'
ADR_Tenant=${1:-$(cat /usr/sbin/CS_Automation/ADR/ADR_Tenants.txt)}
ADR_Backup_Path='/usr/sbin/tenant'
ADR_Path='/usr/sbin/tenant'
Source_Path='/usr/sbin/CS_Automation/ADR'
Service_Path='/lib/systemd/system'

set -e

################# Taking Backup of FFT for All Tenants ###################
ADR_Backup() {
	echo "========== Taking the backup of ADR =========="
	for tenant in $ADR_Tenant
	do	
		echo "$pass" | sudo -S rm -rf "${ADR_Backup_Path}/${tenant}/ADR/backup"/*
		cd ${ADR_Path}/${tenant}/ADR/
		for file in *
		do
			if [ $file != 'backup' ]
			then
				echo "$pass" | sudo -S mv "$file" "${ADR_Backup_Path}/${tenant}/ADR/backup/"
			else
				continue;
			fi
		done
	done
}

############# Moving new version to all tenants ##############
ADR_New_Update() {
	echo "========== Moving new version of FFT to tenants =========="
	for tenant in $ADR_Tenant
	do
		cd ${Source_Path}
		echo "$pass" | sudo -S cp -r ADR/ *.txt *.py "${ADR_Path}/${tenant}/ADR/"
	done
}

######################## Restarting the Service ###############################
service_restart() {
	cd "$Service_Path"
	echo "$pass" | sudo -S systemctl restart ADR_Service
}

######################### Calling the Functions #################################
ADR_Backup
ADR_New_Update
# service_restart

echo "ADR Service is updated Successfully"

