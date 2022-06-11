#Define environment variables

# export PGPASSWORD=ocolis
# export PGUSER=ocolis
# export PGDATABASE=ocolis

#Create script
psql -f ocolis_r0.sql
psql -f ocolis_r1.sql
psql -f ocolis_r2.sql
psql -f ocolis_r3.sql
psql -f ocolis_r4.sql
psql -f ocolis_r5.sql
psql -f ocolis_r6.sql
psql -f ocolis_r7.sql #insertion test
psql -f ocolis_time_test.sql #insertion expedition time test
psql -f ocolis_r8.sql

#config pg_hba.conf