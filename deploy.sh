# Export variables d'environnements
export PGUSER=ocolis
export PGPASSWORD=ocolis

# https://sqitch.org/docs/manual/sqitch-deploy/
# sqitch deploy [options] [<database>]
# sqitch deploy [options] [<database>] --to-change <change>

# Deploy Global :
# sqitch deploy -d ocolis ocolis_v1
sqitch deploy -d ocolis ocolis_v2