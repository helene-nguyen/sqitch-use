BEGIN;

DROP TABLE IF EXISTS "vehicle";

CREATE TABLE IF NOT EXISTS "vehicle"(
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "driver_name" TEXT NOT NULL,
    "vehicle_plate" TEXT NOT NULL,
    "starting_time" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    "ending_time" TIMESTAMPTZ,
    "package_id" INT REFERENCES package(id)
);

COMMIT;