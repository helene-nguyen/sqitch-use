-- Revert ocolis_sqitch:ocolis_v1 from pg

BEGIN;

DROP TABLE "place","package";

COMMIT;
