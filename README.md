# Summary
* BackupPC based on Ubuntu 14.04
* Support for sending status mail using msmtp
* Support for external settings, to allow automated container update/stop/rm/start

# How to use
* Change the smtp host in msmtprc
* Place config.pl and localhost.pl config files into <your-settings-folder>
* Cd into the repository's directory
* Run ```docker build --build-arg password=<your-password> .```
* Run the image ```docker run -d -P -v /<your-backup-folder>:/var/lib/backuppc -v /<your-settings-folder>:/opt/backuppc_settings <image-id>```
