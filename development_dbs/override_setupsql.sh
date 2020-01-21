#!/bin/bash

rm -f /pgconf/setup.sql /pgconf/grants.sql
curl https://raw.githubusercontent.com/sogis/oereb-db/master/sql/setup_original.sql > /pgconf/setup_original.sql
curl https://raw.githubusercontent.com/sogis/oereb-db/master/sql/set_role.sql > /pgconf/set_role.sql
# Hack/unnecessary but required command (PG_WRITE_USER does not exist yet):
sed -i s/:PG_WRITE_USER/${PG_USER}/g /pgconf/setup.sql

echo "CREATE USER :PG_WRITE_USER WITH PASSWORD :'PG_WRITE_PASSWORD'; GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA arp_npl_oereb TO :PG_WRITE_USER; GRANT USAGE ON ALL SEQUENCES IN SCHEMA arp_npl_oereb TO :PG_WRITE_USER;" > /pgconf/grants.sql

exec "$@"
