# O'colis

## Version 1

![v1](./images/first.png)

## Version 2

Changement du type de la colonne "serial_number" en champ texte

![v2](./images/v2.png)

## Version 3

Rendre la colonne "serial_number" UNIQUE

![v3](./images/v3.png)

## Version 4

Modifier une colonne et ajouter 2 colonnes 

![v4](./images/v4.png)
## Version 5

Ajout des colonnes pour récupérer les dates

```shell
ocolis=> \d package
                                          Table « public.package »
       Colonne       |           Type           | Collationnement | NULL-able |          Par défaut
---------------------+--------------------------+-----------------+-----------+------------------------------
 id                  | integer                  |                 | not null  | generated always as identity
 serial_number       | text                     |                 | not null  |
 content_description | text                     |                 | not null  |
 weight              | double precision         |                 | not null  |
 height              | integer                  |                 | not null  |
 worth               | integer                  |                 | not null  |
 sender_id           | integer                  |                 |           |
 recipient_id        | integer                  |                 |           |
 width               | integer                  |                 | not null  |
 depth               | integer                  |                 | not null  |
 request_time        | timestamp with time zone |                 | not null  | now()
 expedition_time     | timestamp with time zone |                 |           |
 delivered_time      | timestamp with time zone |                 |           |
Index :
    "package_pkey" PRIMARY KEY, btree (id)
    "package_serial_number_key" UNIQUE CONSTRAINT, btree (serial_number)
Contraintes de clés étrangères :
    "package_recipient_id_fkey" FOREIGN KEY (recipient_id) REFERENCES place(id)
    "package_sender_id_fkey" FOREIGN KEY (sender_id) REFERENCES place(id)

```

## ADD DELIVERER

### MCD

![mcd-v2](./images/mcd-v2.png)

```
belongs to, 01 PACKAGE, 0N VEHICLE
PACKAGE: code_package, serial_number, content_description, weight, height, width, depth, worth, request_time, expedition_time, delivered_time
send, 0N PLACE, 11 PACKAGE

VEHICLE: code_vehicle, driver_name, vehicle_plate, starting_time, ending_time
receive, 0N PLACE, 11 PACKAGE
PLACE: code_place, reference, name, address, additionnal, postal_code, city
```

### MLD - V2

```
PACKAGE ( code_package, serial_number, content_description, weight, height, width, depth, worth, request_time, expedition_time, delivered_time, code_place, code_vehicle, code_place.1 )
VEHICLE ( code_vehicle, driver_name, vehicle_plate, starting_time, ending_time )
PLACE ( code_place, reference, name, address, additionnal, postal_code, city )
```

