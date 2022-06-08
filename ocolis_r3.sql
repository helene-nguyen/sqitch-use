BEGIN;

ALTER TABLE "package"
ADD UNIQUE ("serial_number");

COMMIT;