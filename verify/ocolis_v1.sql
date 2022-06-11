-- Verify ocolis_sqitch:ocolis_v1 on pg

BEGIN;

SELECT "id" FROM "place";
SELECT "id" FROM "package";

ROLLBACK;