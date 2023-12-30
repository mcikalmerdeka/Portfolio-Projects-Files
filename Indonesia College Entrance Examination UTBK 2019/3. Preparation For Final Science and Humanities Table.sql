-- Checking every imported tables
SELECT *
FROM universities_modified;

SELECT *
FROM majors;

SELECT *
FROM science;

SELECT *
FROM humanities;


-- Merging univ_majors with science scores and create new table
CREATE TABLE IF NOT EXISTS science_merge AS
SELECT *
FROM universities_modified u
JOIN majors m USING (id_university)
JOIN science sc ON m.id_major = sc.id_first_major;

-- Merging univ_majors with humanities scores and create new table
CREATE TABLE IF NOT EXISTS humanities_merge AS
SELECT *
FROM universities_modified u
JOIN majors m USING (id_university)
JOIN humanities hm ON m.id_major = hm.id_first_major;


-- Creating the average score column for science
ALTER TABLE science_merge
ADD COLUMN average_score_science DECIMAL DEFAULT 0;

UPDATE science_merge
SET average_score_science = ROUND(CAST((score_bio + score_fis + score_kim + score_kmb + 
                                       score_kpu + score_kua + score_mat + score_ppu) / 8 AS numeric), 2);

-- Creating the average score column for humanities
ALTER TABLE humanities_merge
ADD COLUMN average_score_humanities DECIMAL DEFAULT 0;

UPDATE humanities_merge
SET average_score_humanities = ROUND(CAST((score_eko + score_geo + score_kmb + score_kpu + 
                                       score_kua + score_mat + score_ppu + score_sej + score_sos) / 8 AS numeric), 2);


-- Change the university_name and major_name uppercase
UPDATE science_merge
SET university_name = INITCAP(university_name);

UPDATE humanities_merge
SET university_name = INITCAP(university_name);

UPDATE science_merge
SET major_name = INITCAP(major_name);

UPDATE humanities_merge
SET major_name = INITCAP(major_name);

-- Checking final table for science and humanities
SELECT *
FROM science_merge;

SELECT *
FROM humanities_merge;

/*

Done checking and everything is the same as with the result in python, and now we answer questions in separated file.

*/

