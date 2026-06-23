#!/bin/bash

echo "Deploy data on server"

rsync -az --delete ./src root@vds_conn:/var/www/mysite

if [ $? -eq 0 ]; then
	echo "Deployed succsessfuly"
else
	echo "Error ocured"
fi
