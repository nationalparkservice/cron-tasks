DELETE FROM "parking_lots"
WHERE "parking_lots"."cartodb_id" NOT IN (
  SELECT "places_polygons"."cartodb_id"
  FROM "places_polygons" JOIN "parking_lots" ON
    "parking_lots"."cartodb_id" = "places_polygons"."cartodb_id" AND
    "parking_lots"."created_at" = "places_polygons"."created_at"
  );
INSERT INTO
  "parking_lots" (
    "cartodb_id",
    "the_geom",
    "class",
    "name",
    "places_created_at",   
    "places_id",
    "places_updated_at",
    "superclass",
    "tags",
    "type",
    "unit_code",
    "version",
    "created_at",
    "updated_at",
    "the_geom_webmercator"
  )
SELECT
  "cartodb_id",
  "the_geom",
  "class",
  "name",
  "places_created_at",   
  "places_id",
  "places_updated_at",
  "superclass",
  "tags",
  "type",
  "unit_code",
  "version",
  "created_at",
  "updated_at",
  "the_geom_webmercator"
FROM
  "places_polygons"
WHERE
  "places_polygons"."cartodb_id" NOT IN (
    SELECT "parking_lots"."cartodb_id"
    FROM "places_polygons" JOIN "parking_lots" ON
      "parking_lots"."cartodb_id" = "places_polygons"."cartodb_id" AND
      "parking_lots"."created_at" = "places_polygons"."created_at"
  ) AND "places_polygons"."type" = 'Parking Lot';
