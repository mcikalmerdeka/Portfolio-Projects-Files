/*

The stages performed from 1-4 sql files are more or less the same as those done using Python, 
starting with importing data and conducting pre-processing, and answering questions. 
However, with some simplifications and more straightforwardly after understanding 
some aspects from the Python results.

*/


-- Table Creation for universities (original)
CREATE TABLE IF NOT EXISTS universities(
	id_university VARCHAR PRIMARY KEY NOT NULL,
	university_name VARCHAR
);


-- Table Creation for majors
CREATE TABLE IF NOT EXISTS majors(
	id_major VARCHAR PRIMARY KEY NOT NULL,
	id_university VARCHAR,
	type VARCHAR,
	major_name VARCHAR,
	capacity INT,
	FOREIGN KEY (id_university) REFERENCES universities (id_university)
);


-- Table Creation for science
CREATE TABLE IF NOT EXISTS science(
    id_first_major VARCHAR,
    id_first_university VARCHAR,
    id_second_major VARCHAR,
    id_second_university VARCHAR,
    id_user VARCHAR PRIMARY KEY NOT NULL,
    score_bio INT,
    score_fis INT,
    score_kim INT,
    score_kmb INT,
    score_kpu INT,
    score_kua INT,
    score_mat INT,
    score_ppu INT,
    FOREIGN KEY (id_first_major) REFERENCES majors (id_major),
    FOREIGN KEY (id_first_university) REFERENCES universities (id_university),
    FOREIGN KEY (id_second_major) REFERENCES majors (id_major),
    FOREIGN KEY (id_second_university) REFERENCES universities (id_university)
);


-- Table Creation for humanities
CREATE TABLE IF NOT EXISTS humanities(
	id_first_major VARCHAR,
	id_first_university VARCHAR,
	id_second_major VARCHAR,
	id_second_university VARCHAR,
	id_user VARCHAR PRIMARY KEY NOT NULL,
	score_eko INT,
	score_geo INT,
	score_kmb INT,
	score_kpu INT,
	score_kua INT,
	score_mat INT,
	score_ppu INT,
	score_sej INT,
	score_sos INT,	
	FOREIGN KEY (id_first_major) REFERENCES majors (id_major),
    FOREIGN KEY (id_first_university) REFERENCES universities (id_university),
    FOREIGN KEY (id_second_major) REFERENCES majors (id_major),
    FOREIGN KEY (id_second_university) REFERENCES universities (id_university)
);


-- Table Creation for geo (latitude and longitude)
CREATE TABLE IF NOT EXISTS latitude_longitude(
	nid VARCHAR PRIMARY KEY NOT NULL,
	parent_nid VARCHAR,
	name VARCHAR,
	serial VARCHAR,
	type VARCHAR,
	latitude decimal,
	longitude decimal,
	status VARCHAR
	FOREIGN KEY (name) REFERENCES universities (province)
);