#Define environment variables

export PGPASSWORD=ocolis
export PGUSER=ocolis
export PGDATABASE=ocolis

#Create script
psql -f ocolis_time_test.sql

#config pg_hba.conf