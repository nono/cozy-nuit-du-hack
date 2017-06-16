#!/bin/bash
echo "⋅ Starting CouchDB…"
sudo -b -i -u couchdb sh -c '/home/couchdb/bin/couchdb >> /var/log/couchdb/couch.log 2>> /var/log/couchdb/couch-err.log'
sleep 10
export COZY_ADMIN_PASSWORD=aMie8iBeDei4phenUev1huJ3
echo -e "$COZY_ADMIN_PASSWORD\n$COZY_ADMIN_PASSWORD" | /usr/local/bin/cozy-stack config passwd /etc/cozy/ > /dev/null
echo "Starting Cozy stack…"
sudo -b -u cozy sh -c '/usr/local/bin/cozy-stack serve --log-level info --host 0.0.0.0 >> /var/log/cozy/cozy.log 2 >> /var/log/cozy/cozy-err.log'
sleep 10
echo "⋅ Creating instance…"
cozy-stack instances add --host 0.0.0.0 --apps drive,photos,settings --passphrase "kee7BohvDei4phen" --email test@cozy.io cozy.tools:1443
echo "⋅ Creating certificate…"
openssl req -x509 -nodes -newkey rsa:4096 -keyout "/etc/cozy/cozy.tools.key" -out "/etc/cozy/cozy.tools.crt" -days 365 -subj "/CN=\*.cozy.tools"
echo "⋅ Configuring NGinx…"
cp /etc/cozy/nginx-config /etc/nginx/sites-available/cozy.tools.conf
ln -s /etc/nginx/sites-available/cozy.tools.conf /etc/nginx/sites-enabled/
echo "⋅ Starting NGinx…"
service nginx start
echo "Running"
read
