#!/bin/bash

backup_dir=("/etc" "/home")
dest_dir="/home/ubuntu/backup"
backup_date=$(date +%b-%d-%y)

sudo mkdir $dest_dir

echo "Starting backup of: ${backup_dir[@]}"

for i in "${backup_dir[@]}";
do
	sudo tar -Pczf /tmp/$i-$backup_date.tar.gz $i	# -P - to not strip leading "/" from absolute paths
	if [ $? -eq 0 ];
	then
		echo "$i backup succeeded"
	else
		echo "$i backup failed."
	fi

sudo cp /tmp/$i-$backup_date.tar.gz $dest_dir

if [ $? -eq 0 ];
then
	echo "$i transfer succeeded"
else
	echo "$i transfer failed"
fi
done

sudo rm -R /tmp/*.gz

echo "Backup completed"
