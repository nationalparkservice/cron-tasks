INSERT INTO
  "places_polygons" (
    "cartodb_id",
    "version",
    "name",
    "places_id",
    "tags",
    "superclass",
    "class",
    "type",
    "rendered",
    "unit_code",
    "the_geom"
  ) VALUES (
    '{{cartodb_id}}',
    '{{version}}',
    '{{name}}',
    '{{places_id}}',
    '{{tags}}',
    '{{superclass}}',
    '{{class}}',
    '{{type}}',
    '{{rendered}}'::text,
    '{{unit_code}}',
    ST_SetSRID(ST_GeomFromGeoJSON('{{the_geom}}'),4326)
  );
