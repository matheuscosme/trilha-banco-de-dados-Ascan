create DATABASE ascan;
use ascan;

create table Built_used_area(
	listing_id int NOT NULL,
    built_area varchar(10),
    used_area varchar(10) null
);

LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Built_used_area.csv'
INTO TABLE Built_used_area
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM BUILT_USED_AREA;