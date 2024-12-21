#!/bin/bash

THRESHOLD=80

#disk usage for each mounted filesystem
check_disk_space(){
	echo " Disk space monitoring"

	while read -r line; do
	    filesystem=$(echo "$line" | awk '{print $1}')
	    usage=$(echo "$line" | awk '{print $5}' | tr -d "%")
            mount_point=$(echo "$line" | awk '{print $6}')
            
            if [ $usage -ge $THRESHOLD ];then
		    echo "WARNING: $filesystem mounted on $mount_point is at ${usage}%"
            else 
		    echo "OK: $filesystem mounted on $mount_point is at ${usage}% "
	    fi
       done < <(df -h |grep '^/dev/')

}

#call function
check_disk_space
