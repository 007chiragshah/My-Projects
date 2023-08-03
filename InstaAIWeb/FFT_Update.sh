#!/bin/bash

#Author = Chirag Sorathiya
#Agenda = This Script will take a backup and will updclient_3 the config file and FFT service

pass='cimcon@123'
FFT_Tenant=${1:-`cat /usr/sbin/CS_Automation/FFT/FFT_Tenants.txt`}
FFT_Backup_Path='/usr/sbin/tenant'
FFT_Path='/usr/sbin/tenant'
Source_Path='/usr/sbin/CS_Automation/FFT'
Service_Path='/lib/systemd/system'
set -e

################# Taking Backup of FFT for All Tenants ###################
FFT_Backup() {
	echo "========== Taking the backup of FFT =================="

        for tenant in $FFT_Tenant
        do
                if  [ $tenant == 'client_1' ]
                then
                        for FFT in FFT1 FFT2 FFT3 FFT4
                        do
                                echo "$pass" | sudo -S rm -rf ${FFT_Backup_Path}/${tenant}/${FFT}/'backup'/*.py
                                echo "$pass" | sudo -S mv ${FFT_Path}/${tenant}/${FFT}/*.py $FFT_Path/$tenant/${FFT}/*.json $FFT_Backup_Path/$tenant/${FFT}/'backup'
                        done
                else
                        echo "$pass" | sudo -S rm -rf ${FFT_Backup_Path}/${tenant}/'FFT/backup'/*.py
                        echo "$pass" | sudo -S mv ${FFT_Path}/${tenant}/'FFT/'*.py $FFT_Path/$tenant/'FFT/'*.json $FFT_Backup_Path/$tenant'/FFT/backup'
                fi
        done
}

############# Moving new version to all tenants ##############

FFT_New_Updclient_3() {
	echo "========== Moving new version of FFT to tenants =================="

	for tenant in $FFT_Tenant
	do
		if  [ $tenant == 'client_1' ]
                then
                        for FFT in FFT1 FFT2 FFT3 FFT4
                        do
				echo "$pass" | sudo -S cp ${Source_Path}/*.py ${Source_Path}/*.json ${FFT_Path}/${tenant}/${FFT}/
                        done
		else
			echo "$pass" | sudo -S cp ${Source_Path}/*.py ${Source_Path}/*.json ${FFT_Path}/${tenant}/'FFT/'
		fi
			
	done
}

################ Updating the config file #####################

FFT_config_updclient_3() {
	echo "=========== updating the config file ======================="

	for tenant in $FFT_Tenant
	do
		if [ $tenant == 'client_1' ]
		then
			for FFT in FFT1 FFT2 FFT3 FFT4
			do
				if [ $FFT == 'FFT1' ]
				then
					echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_1",/' $FFT_Path/$tenant/$FFT/'config.json'
        		                echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_GCP_client_1",/' $FFT_Path/$tenant/$FFT/'config.json'
	                	        echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_1_raw_data",/' $FFT_Path/$tenant/$FFT/'config.json'
                        		echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_1_cal_data",/' $FFT_Path/$tenant/$FFT/'config.json'
	                        	echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/$FFT/'config.json'
        	        	        echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_1.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/$FFT/'config.json'
        		                echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "client_1@123",/' $FFT_Path/$tenant/$FFT/'config.json'
	                	        echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/$FFT/'config.json'

				elif [ $FFT == 'FFT2' ]
				then
					echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_12",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_GCP_client_1_2",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_12_raw_data",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_12_cal_data",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_1.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "client_1@123",/' $FFT_Path/$tenant/$FFT/'config.json'
                        		echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/$FFT/'config.json'

				elif [ $FFT == 'FFT3' ]
				then
					echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_13",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_GCP_client_1_3",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_13_raw_data",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_13_cal_data",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_1.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "client_1@123",/' $FFT_Path/$tenant/$FFT/'config.json'
                        		echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/$FFT/'config.json'

				elif [ $FFT == 'FFT4' ]
				then
					echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_14",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_GCP_client_1_4",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_14_raw_data",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_14_cal_data",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_1.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/$FFT/'config.json'
                		        echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "client_1@123",/' $FFT_Path/$tenant/$FFT/'config.json'
		                        echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/$FFT/'config.json'
				fi
			done

		elif [ $tenant == 'client_3' ]
		then
		 	echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_3",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_3",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_3_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_3_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_3.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Ate@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'	
		
		elif [ $tenant == 'client_2_bkp' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_2",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_2",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_2_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_2_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_2.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Balaji#123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'
			
		elif [ $tenant == 'client_4' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_4",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_4",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_4_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_4_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_4.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "BLP@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_5' ]
		then	
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_5",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_5",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_5_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_5_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_5.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "cimcon",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'
			
		elif [ $tenant == 'client_6' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "data_krew",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_6",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_6_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_6_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_6.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Datakrew@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'
			
		elif [ $tenant == 'demo' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "demo",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_demo",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "demo_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "demo_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "krinap@cimcon.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "krina@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_7' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_7",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_7",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_7_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_7_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_7.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Eks@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'
				
		
		elif [ $tenant == 'client_8' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_8",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_Eureka",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_8_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_8_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_8.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Eureka@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_9' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_9_labs",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_Faclon",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_9_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_9_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_9.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Faclon@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_10' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_10_tech",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_Futurism",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_10,_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_10_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_10.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Futurism@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_11' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_11",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_GCP_client_11",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_11_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_11_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_11.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Gift@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_12' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_12",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_12",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_12_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_12_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:808010.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_12.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "cimcon",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_13' ]
		then

			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_13",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_MVS",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_13_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_13_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_13.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "client_13@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_14' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "saturn_pyro",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_Saturnpyro",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "saturn_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "saturn_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "Saturnpyro@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Saturn@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_15' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_15",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_rahul",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "rahul_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "rahul_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "demo@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "cimcon",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		elif [ $tenant == 'client_16' ]
		then
			echo "$pass" | sudo -S sed -i 's/"tenant_name": .*/"tenant_name": "client_16",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"topic": .*/"topic": "FFTData_client_16",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"raw_topic": .*/"raw_topic": "client_16_raw_data",/' $FFT_Path/$tenant/'FFT/config.json'
                        echo "$pass" | sudo -S sed -i 's/"cal_topic": .*/"cal_topic": "client_16_cal_data",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"thingsboard_ip": .*/"thingsboard_ip": "10.128.0.10:8080",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"username": .*/"username": "client_16.cimcon@cimcondigital.com",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"password": .*/"password": "Versada@123",/' $FFT_Path/$tenant/'FFT/config.json'
			echo "$pass" | sudo -S sed -i 's/"creclient_3_log_folder": .*/"creclient_3_log_folder": true,/' $FFT_Path/$tenant/'FFT/config.json'

		else
			echo "enter the valid tenant name"

		fi
		
	done
}

######################## Updating the FFT Service ############################
service_updclient_3() {

	for tenant in $FFT_Tenant
	do
		cd ${Service_Path}
		
       	        if [ $tenant == 'client_1' ]
               	then
			for client_1ha in client_1 client_12 client_13 client_14
                       	do
				Lclient_3st_FFT_Ver=$(cat /usr/sbin/tenant/${tenant}/FFT1/config.json | grep FFT_Version | awk '{print substr( $2, 2, 5)}')
                                FFT_Raw_Data=$(cat ${client_1ha}-fft-datacollector.service | grep -o '2\..*\.py')
                                FFT_Cal=$(cat ${client_1ha}-fft-calculation.service | grep -o '2\..*\.py')
                                FFT_Post=$(cat ${client_1ha}-fft-posting.service | grep -o '2\..*\.py')
                       	
		       		echo "$pass" | sudo -S sed -i "s/${FFT_Raw_Data}/${Lclient_3st_FFT_Ver}.py/" ${client_1ha}-fft-datacollector.service
                		echo "$pass" | sudo -S sed -i "s/${FFT_Cal}/${Lclient_3st_FFT_Ver}.py/" ${client_1ha}-fft-calculation.service
		                echo "$pass" | sudo -S sed -i "s/${FFT_Post}/${Lclient_3st_FFT_Ver}.py/" ${client_1ha}-fft-posting.service
			done
		else
          
   		        Lclient_3st_FFT_Ver=$(cat /usr/sbin/tenant/${tenant}/FFT/config.json | grep FFT_Version | awk '{print substr( $2, 2, 5)}')
		        FFT_Raw_Data=$(cat ${tenant}-fft-datacollector.service | grep -o '2\..*\.py')
	        	FFT_Cal=$(cat ${tenant}-fft-calculation.service | grep -o '2\..*\.py')
		        FFT_Post=$(cat ${tenant}-fft-posting.service | grep -o '2\..*\.py')
	
		        echo "$pass" | sudo -S sed -i "s/${FFT_Raw_Data}/${Lclient_3st_FFT_Ver}.py/" ${tenant}-fft-datacollector.service
		        echo "$pass" | sudo -S sed -i "s/${FFT_Cal}/${Lclient_3st_FFT_Ver}.py/" ${tenant}-fft-calculation.service
	        	echo "$pass" | sudo -S sed -i "s/${FFT_Post}/${Lclient_3st_FFT_Ver}.py/" ${tenant}-fft-posting.service
		fi
	done
}
######################## Restarting the Service ###############################
service_restart() {

        for tenant in $FFT_Tenant
        do
                if [ $tenant == 'client_1' ]
                then
                        for service in client_1 client_12 client_13 client_14
                        do
                                echo "$pass" | sudo -S systemctl daemon-reload
                                echo "$pass" | sudo -S systemctl restart ${service}-fft-*
                        done
		else

	                echo "$pass" | sudo -S systemctl daemon-reload
        	        echo "$pass" | sudo -S systemctl restart ${tenant}-fft-*
		fi
        done
}


######################### Calling the Function #################################
FFT_Backup
FFT_New_Updclient_3
FFT_config_updclient_3
#service_updclient_3
#service_restart

echo "FFT Service is updclient_3d successfully..."
################################ End of the Script ###########################################
