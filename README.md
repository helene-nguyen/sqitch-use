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

Launch the file in bash

```sh
sh ./init.sh
```

Or create an alias in .bashrc

Once init, you can #checkSQITCH if everything is ok and if you well have your init

```sh
sqitch plan -f short --no-headers
```

Result 

![initialization](./__images/sq.PNG)

Custom message commit

```sh
sqitch plan -f format:'Title of commits Sqitch '%v%{date}p' 
'%s
```

```sh
# Project: ocolis
# File:    sqitch.plan

Title of commits Sqitch
2022-06-11 08:52:24 +0200 First version
```

### 2. Deployment and verification

`deploy` : Create tables

`revert` : Drop tables

`verify` : Check if ok


```sh
sqitch deploy -d ocolis ocolis_v1
```

```sh
sqitch deploy -d ocolis ocolis_v2 
```

etc.


## Revert

```sh
sqitch revert --to ocolis_v1
```

We want to do the revert to old version.

Tips : Sometimes, you cannot revert TEXT into INTEGER

```sql
BEGIN;
ALTER TABLE "package"
ALTER COLUMN "serial_number" TYPE INTEGER 
USING ("serial_number"::INTEGER);
COMMIT;
```

## Verify

```sh
sqitch verify -d ocolis
```

Check if we find what we want in the DB