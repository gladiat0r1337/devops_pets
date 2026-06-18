#!/bin/bash

LOG_PATH="$1"
LOG_STORAGE="./logs_archive"
DATE=$(date +%F_%H-%M-%S)
ARCHIVE_NAME="log_archive_${DATE}.tar.gz"


if [ -z "$LOG_PATH" ]; then
	echo "Script requires 1 argument(path for archivation)."
elif [ ! -d "$LOG_PATH" ]; then
	echo "Argument is not directory or it does not exists."

elif [ ! -d "$LOG_STORAGE" ]; then
	mkdir -p "$LOG_STORAGE"
	echo "Creating diretory for archives..."
fi

tar -czf "${LOG_STORAGE}/${ARCHIVE_NAME}" "${LOG_PATH}"

if [ $? -eq 0 ]; then
	echo "Archive created succesfully!"
else
	echo "Something went wrong("
	exit 1
fi
