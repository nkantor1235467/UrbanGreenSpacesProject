This is the readme document containing my workflow for the urban green spaces lab.

To start, I downloaded a subset of the data from open street map from the website BBBike corresponding to the Cleveland Ohio metro area. I then imported that data into postgresql using the osm2pgsql tool.

# Command 1
1. CREATE TABLE green_spaces (
2.     id SERIAL PRIMARY KEY
3.     name VARCHAR(255),
4.     location GEOMETRY(Point, 4326),
5.     area_sq_m NUMERIC
6. );
The above command was used to create a table called green spaces.

# Command 2
1. INSERT INTO green_spaces (name, location, area_sq_m)
2. SELECT name, ST_Transform(ST_Centroid(way),4326)as Iocn, ST_Area(way)
3. FROM planet_osm_polygon
4. WHERE leisure = 'park';
The above command populates the table with the coordinates of all the parks in the area I selected, in addition to their names and areas in square meters. The file in the repository called green_spaces_table is the result of this step.

# Command 3
1. SELECT SUM(ST_Area(way)) as total_green_space_area
2. FROM planet_osm_polygon
3. WHERE leisure = 'park';
The above command produced the sum of total green space area from the table which was 48643509.48422989 square meters, equivalent to 18.781364 square miles.

# Command 4
1. SELECT osm_id, name, way as city_boundary
2. FROM planet_osm_polygon
3. WHERE place = 'city'
4. ORDER BY name;
The above command produced one row as the output containing the city boundary for the city of Lakewood Ohio, which is a suburb of Cleveland. I assume this is the only open street map city boundary that was fully inside the polygon that I drew when downloading the data.

# Command 5
1. SELECT distinct leisure
2. FROM planet_osm_polygon
3. --WHERE place = 'city'
4. --ORDER BY name;
The above command produced a list of leisure categories for the area I selected such as water park and playground. The file in the repository called distinct_leisure.csv contains the output.

# Command 6
1. SELECT distinct name
2. FROM planet_osm_polygon
3. WHERE UPPER(name) LIKE '%CLEVELAND%';
The above command, similar to the previous command, produced a list of names, only this time it selected names of locations that had the word Cleveland in the name. Unsurprisingly, this was a long list because of the area around Cleveland that I selected. The output is the repository file called distinct_name.csv.