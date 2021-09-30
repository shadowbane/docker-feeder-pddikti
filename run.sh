#!/bin/bash

if [ ! -d "/var/lib/postgresql/9.6" ] 
  then
    echo "Database data already exist..."
  else
    echo "Copying default data..."
    tar -zxfv /feeder/postgresql.tar.gz -C /var/lib
fi

#change directory owner
echo "Changing directory owners..."
chown www-data:www-data -R /home/prefill
chown postgres:postgres -R /var/lib/postgresql

#start services
echo "Starting services..."
/etc/init.d/postgresql start
/etc/init.d/apache2 start

tail -f /var/log/lastlog
