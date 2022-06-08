BEGIN;

ALTER TABLE "package"
ALTER COLUMN "serial_number"
TYPE text;

COMMIT;