#!/bin/bash

if [ ! -e /firstrun ]
then
	mkdir /var/lib/backuppc/cpool
	mkdir /var/lib/backuppc/pc
	chown backuppc:backuppc /var/lib/backuppc -R

	# Copy config files from external volume
	cp /opt/backuppc_settings/localhost.pl /etc/backuppc/localhost.pl
	cp /opt/backuppc_settings/config.pl /etc/backuppc/config.pl
	chown backuppc:www-data /etc/backuppc/localhost.pl
	chown backuppc:www-data /etc/backuppc/config.pl

	# Get the password from the settings and use it to set backuppc user's password
	htpasswd -b /etc/backuppc/htpasswd backuppc `cat /opt/backuppc_settings/passwd`

	echo 1 > /firstrun
fi

exec /usr/local/bin/supervisord -c /etc/supervisord.conf
