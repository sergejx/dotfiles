#!/bin/sh
# Simple backups based on article
# http://blog.interlinked.org/tutorials/rsync_time_machine.html

FILES=$HOME                     # What to backup
BACKUPS=/media/sklad/backups    # Where to store backups
# File .rsync-filter can be used to exclude/include some files
# Use `man 1 rsync` for more information

date=`date "+%Y-%m-%dT%H:%M:%S"`
rsync -aPF --link-dest=$BACKUPS/current $FILES $BACKUPS/back-$date
rm $BACKUPS/current
ln -s back-$date $BACKUPS/current

