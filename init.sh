# Launch from postgres and define temporarely an environment variable
export PGUSER=postgres

# Create user in DB
# -W force to ask password to DB but if in pg_hba.conf is in 'trust', no need to put any password
# -P open console to create password
createuser -l -P ocolis 

# Create DB
createdb -O ocolis ocolis

# Initialize Sqitch with postgres
sqitch init ocolis --uri https://github.com/helene-nguyen/sqitch-use --engine pg

# Starter commit change
sqitch add ocolis_v1 -n 'First version'

