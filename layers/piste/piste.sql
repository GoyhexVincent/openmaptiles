CREATE OR REPLACE FUNCTION layer_piste(bbox geometry, zoom_level integer)
RETURNS TABLE(osm_id bigint, geometry geometry, difficulty text, name text) AS $$
    SELECT osm_id, geometry, difficulty, name
    FROM osm_piste_linestring 
    WHERE zoom_level >= 14 AND geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;

