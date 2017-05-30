/*
 * Author: George Fisher george at georgefisher dot com
 *
 * Purpose: The DataTables Editor plugin (https://editor.datatables.net/)
 *          requires an integer primary key called 'id'.
 *
 *          The DB Browser for SQLite import from csv brings in only
 *          TEXT and does not specify a PRIMARY KEY
 *
 *          This script
 *             1. creates a temporary file with id INTEGER  PRIMARY KEY autoincrement
 *             2. copies the data from the flowers table into it
 *             3. deletes the flowers table
 *             4. recreates the flowers table with an id field and specifications for the other fields
 *             5. copies the data from the backup file into flowers
 *             6. deletes the temporary file
 *
 * Note: if you download flowers.csv from tables.html it will
 *       have an id column which you must delete before importing.
 */


drop table if exists flowers_backup;
CREATE TEMPORARY TABLE flowers_backup
( id INTEGER  PRIMARY KEY autoincrement, `latin` , `common` , `image_name` , `height_code` , `bloom_code` , `sun_code` , `moist_code` , `cat_code` , `deer_code` , `wild_code` , `soil_code` , `wildlife_comments` , `design_function` , `gardening_tips` , `credit_code` );
INSERT INTO flowers_backup (`latin` , `common` , `image_name` , `height_code` , `bloom_code` , `sun_code` , `moist_code` , `cat_code` , `deer_code` , `wild_code` , `soil_code` , `wildlife_comments` , `design_function` , `gardening_tips` , `credit_code` ) select * from flowers;



DROP TABLE flowers;

CREATE TABLE flowers
( id integer  primary key autoincrement,
  `latin` TEXT,
  `common` TEXT NOT NULL,
  `image_name` TEXT NOT NULL ,
  `height_code` TEXT NOT NULL ,
  `bloom_code` TEXT NOT NULL ,
  `sun_code` TEXT NOT NULL ,
  `moist_code` TEXT NOT NULL ,
  `cat_code` TEXT NOT NULL ,
  `deer_code` TEXT NOT NULL ,
  `wild_code` TEXT NOT NULL ,
  `soil_code` TEXT NOT NULL ,
  `wildlife_comments` TEXT,
  `design_function` TEXT,
  `gardening_tips` TEXT,
  `credit_code` TEXT NOT NULL );
INSERT INTO flowers SELECT * FROM flowers_backup;

DROP TABLE flowers_backup;
