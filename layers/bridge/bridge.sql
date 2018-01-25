CREATE OR REPLACE FUNCTION layer_bridge(bbox geometry, zoom_level integer)
RETURNS TABLE(osm_id bigint, geometry geometry, wikidata text, name text) AS $$
    SELECT osm_id, geometry, wikidata, name
    FROM osm_bridge_polygon 
    WHERE zoom_level >= 14 AND geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;

