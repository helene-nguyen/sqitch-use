-- Revert ocolis_sqitch:ocolis_v2 from pg

BEGIN;
ALTER TABLE "package"
ALTER COLUMN "serial_number" TYPE INTEGER 
USING ("serial_number"::INTEGER);
COMMIT;
