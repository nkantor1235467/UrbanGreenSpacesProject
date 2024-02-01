CREATE TABLE green_spaces (
    id SERIAL PRIMARY KEY
    name VARCHAR(255),
    location GEOMETRY(Point, 4326),
    area_sq_m NUMERIC
);

INSERT INTO green_spaces (name, location, area_sq_m)
SELECT name, ST_Transform(ST_Centroid(way),4326)as Iocn, ST_Area(way)
FROM planet_osm_polygon
WHERE leisure = 'park';

SELECT SUM(ST_Area(way)) as total_green_space_area
FROM planet_osm_polygon
WHERE leisure = 'park';

SELECT osm_id, name, way as city_boundary
FROM planet_osm_polygon
WHERE place = 'city'
ORDER BY name;

SELECT distinct leisure
FROM planet_osm_polygon
--WHERE place = 'city'
--ORDER BY name;

SELECT distinct name
FROM planet_osm_polygon
WHERE UPPER(name) LIKE '%CLEVELAND%';

