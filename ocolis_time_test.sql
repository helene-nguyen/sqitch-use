BEGIN;
UPDATE "package"
SET "expedition_time" = NOW();

UPDATE "package"
SET "expedition_time" = NOW() + INTERVAL '1 DAY'
WHERE "id" = 3;

UPDATE "package"
SET "expedition_time" = NOW() + INTERVAL '1 DAY'
WHERE "id" = 5;
COMMIT;