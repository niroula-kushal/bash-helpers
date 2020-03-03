#!/bin/bash
echo "Server name: (local-coop)";
read serverName;
echo "Document root : (path to public_html)";
read docRoot;
echo "
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName $serverName 
    ServerAlias www.$serverName
    DocumentRoot $docRoot
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
	
	<Directory />
	Options Indexes FollowSymLinks
AllowOverride All
Require all granted
</Directory>
</VirtualHost>
" > /etc/apache2/sites-available/$serverName.conf;

sudo a2ensite $serverName.conf;

sudo echo "127.0.0.1 	$serverName" >> /etc/hosts;

sudo systemctl restart apache2;
