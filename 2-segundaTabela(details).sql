use ascan;

create table Details(
	listing_id int NOT NULL,
    Details varchar(250)
);

LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Details.csv'
INTO TABLE Details
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM BUILT_USED_AREA;
SELECT * FROM DETAILS;