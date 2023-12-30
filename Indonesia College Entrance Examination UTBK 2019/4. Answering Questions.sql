/*

QUESTIONS

1. The top 10 participants with the highest average UTBK scores, along with their majors and universities (science & humanities)

2. The top 10 universities with the highest average UBTK scores (science & humanities)

3. The top 10 universities preferred by participants who took the test or the most applicants (science & humanities)

4. The top 10 universities that received the most applicants (science & humanities)

5. The top 10 majors preferred by participants who took the test or the most applicants (science & humanities)

7. The ranking of provinces based on the number of applicants (science and humanities)

*/


-- QUESTION 1

-- Science Clusters
SELECT id_user, university_name, major_name, average_score_science
FROM science_merge
ORDER BY average_score_science DESC
LIMIT 10;

-- Humanities Clusters
SELECT id_user, university_name, major_name, average_score_humanities
FROM humanities_merge
ORDER BY average_score_humanities DESC
LIMIT 10;


-- QUESTION 2

-- Science Clusters
SELECT university_name, ROUND(AVG(average_score_science),2) AS average_scores
FROM science_merge
GROUP BY university_name
ORDER BY Average_Scores DESC
LIMIT 10;

-- Humanities Clusters
SELECT university_name, ROUND(AVG(average_score_humanities),2) AS average_scores
FROM humanities_merge
GROUP BY university_name
ORDER BY Average_Scores DESC
LIMIT 10;


-- QUESTION 3

-- Science Clusters
SELECT university_name, COUNT(id_user) AS number_of_participant
FROM science_merge
GROUP BY university_name
ORDER BY Number_of_Participant DESC
LIMIT 10;

-- Humanities Clusters
SELECT university_name, COUNT(id_user) AS number_of_participant
FROM humanities_merge
GROUP BY university_name
ORDER BY Number_of_Participant DESC
LIMIT 10;


-- QUESTION 4

-- Science Clusters
WITH science_merge_four AS(
	SELECT DISTINCT university_name, major_name, capacity
	FROM science_merge
)

SELECT university_name, SUM(capacity) AS number_of_capacity
FROM science_merge_four
GROUP BY university_name
ORDER BY number_of_capacity DESC
LIMIT 10;

-- Humanities Clusters
WITH humanities_merge_four AS(
	SELECT DISTINCT university_name, major_name, capacity
	FROM humanities_merge
)

SELECT university_name, SUM(capacity) AS number_of_capacity
FROM humanities_merge_four
GROUP BY university_name
ORDER BY number_of_capacity DESC
LIMIT 10;


-- QUESTION 5

-- Science Clusters
SELECT major_name, COUNT(id_user) AS number_of_participant
FROM science_merge
GROUP BY major_name
ORDER BY number_of_participant DESC
LIMIT 10;

-- Humanities Clusters
SELECT major_name, COUNT(id_user) AS number_of_participant
FROM humanities_merge
GROUP BY major_name
ORDER BY number_of_participant DESC
LIMIT 10;


-- QUESTION 7

-- Science Clusters
SELECT province, COUNT(id_user) AS number_of_participant
FROM science_merge
GROUP BY province
ORDER BY number_of_participant DESC
LIMIT 10;

-- Humanities Clusters
SELECT province, COUNT(id_user) AS number_of_participant
FROM humanities_merge
GROUP BY province
ORDER BY number_of_participant DESC
LIMIT 10;
