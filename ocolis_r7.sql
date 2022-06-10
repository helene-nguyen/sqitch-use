BEGIN;

INSERT INTO "place"("reference", "name", "address", "additional", "postal_code","city")
VALUES ('user','user','user','user',68000,'user');

INSERT INTO "package"("serial_number", "content_description", "weight", "height", "worth","sender_id", "recipient_id","width","depth")
VALUES 
    ('package0','test',5.5,10,10,1,1,10,10),
    ('package1','test',5.5,10,10,1,1,10,10),
    ('package2','test',5.5,10,10,1,1,10,10),
    ('package3','test',5.5,10,10,1,1,10,10),
    ('package4','test',5.5,10,10,1,1,10,10);

INSERT INTO "vehicle"("driver_name", "vehicle_plate", "package_id")
VALUES 
    ('test','az',1),
    ('test','az',2),
    ('test','az',3),
    ('test','az',4),
    ('test','az',5);

COMMIT;