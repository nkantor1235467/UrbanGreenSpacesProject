this is the readme for urbangreenspaces

# Command 1
1. CREATE TABLE green_spaces (
2.     id SERIAL PRIMARY KEY
3.     name VARCHAR(255),
4.     location GEOMETRY(Point, 4326),
5.     area_sq_m NUMERIC
6. );
# Command 2
1. INSERT INTO green_spaces (name, location, area_sq_m)
2. SELECT name, ST_Transform(ST_Centroid(way),4326)as Iocn, ST_Area(way)
3. FROM planet_osm_polygon
4. WHERE leisure = 'park';