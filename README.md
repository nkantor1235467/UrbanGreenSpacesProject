this is the readme for urbangreenspaces

# Command 1
CREATE TABLE green_spaces (
    id SERIAL PRIMARY KEY
    name VARCHAR(255),
    location GEOMETRY(Point, 4326),
    area_sq_m NUMERIC
);
# Command 2
INSERT INTO green_spaces (name, location, area_sq_m)
SELECT name, ST_Transform(ST_Centroid(way),4326)as Iocn, ST_Area(way)
FROM planet_osm_polygon
WHERE leisure = 'park';