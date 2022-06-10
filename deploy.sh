#Define environment variables

export PGPASSWORD=ocolis
export PGUSER=ocolis
export PGDATABASE=ocolis

#Create script
psql -f ocolis_r0.sql
psql -f ocolis_r1.sql
psql -f ocolis_r2.sql
psql -f ocolis_r3.sql
psql -f ocolis_r4.sql
psql -f ocolis_r5.sql
psql -f ocolis_r6.sql
psql -f ocolis_r7.sql

#config pg_hba.conf