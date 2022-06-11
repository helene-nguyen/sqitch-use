# SQITCH 

## Step by step

### 1. Initialization

Create a file init.sh to start the project

```sh
# Create user in DB
createuser -l -W ocolis 

# Create DB
createdb -O ocolis ocolis

# Initialize Sqitch with postgres
sqitch init ocolis --uri https://github.com/helene-nguyen/sqitch-use --engine pg

# Starter commit change
sqitch add ocolis_v1 -n 'First version'
```
Source [Postgres](https://docs.postgresql.fr/10/app-createuser.html)

###
###
###
###
###
###
###
###
###
###
###
###
###