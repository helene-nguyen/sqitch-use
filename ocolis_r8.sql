BEGIN;

--source https://docs.postgresql.fr/9.6/sql-update.html
UPDATE "vehicle" AS v
SET "starting_time" = (SELECT DISTINCT "expedition_time" 
FROM "package" AS p WHERE p.id = v.package_id );

ALTER TABLE "package"
DROP COLUMN "expedition_time";

COMMIT;