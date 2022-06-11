-- Deploy ocolis_sqitch:ocolis_v2 to pg

BEGIN;

ALTER TABLE "package"
ALTER COLUMN "serial_number" TYPE TEXT;

COMMIT;
