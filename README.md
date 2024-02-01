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
# Command 3
1. SELECT SUM(ST_Area(way)) as total_green_space_area
2. FROM planet_osm_polygon
3. WHERE leisure = 'park';
Command 3 output: total green space area is 48643509.48422989

# February 1 queries
# query 1
1. SELECT osm_id, name, way as city_boundary
2. FROM planet_osm_polygon
3. WHERE place = 'city'
4. ORDER BY name;
# query 2
1. SELECT distinct leisure
2. FROM planet_osm_polygon
3. --WHERE place = 'city'
4. --ORDER BY name;


