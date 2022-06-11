# Create user in DB
# -W force to ask password to DB but if in pg_hba.conf is in 'trust', no need to put any password
createuser -l -W ocolis 

# Create DB
createdb -O ocolis ocolis

# Initialize Sqitch with postgres
sqitch init ocolis --uri https://github.com/helene-nguyen/sqitch-use --engine pg

# Starter commit change
sqitch add ocolis_v1 -n 'First version'