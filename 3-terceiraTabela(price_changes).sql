use ascan;


CREATE TABLE Price_changes(
	listing_id int,
    old_price int,
    new_price int,
    change_date date
    );
    

LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Price_changes.csv'
INTO TABLE Price_changes
FIELDS TERMINATED BY '	'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from price_changes;
