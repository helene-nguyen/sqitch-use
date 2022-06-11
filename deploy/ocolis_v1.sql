-- Deploy ocolis_sqitch:ocolis_v1 to pg

BEGIN;

CREATE TABLE "place" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "reference" TEXT NOT NULL UNIQUE,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "additional" TEXT,
    "postal_code" INT NOT NULL,
    "city" TEXT NOT NULL
);

CREATE TABLE "package" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "serial_number" INT NOT NULL,
    "content_description" TEXT NOT NULL,
    "weight" FLOAT NOT NULL, -- en kg, avec précision au gramme près
    "volume" INT NOT NULL, -- en centimètres cubes
    "worth" INT NOT NULL, -- c'est approximatif à l'euro près
    "sender_id" INT REFERENCES place(id),
    "recipient_id" INT REFERENCES place(id)
);

COMMIT;
