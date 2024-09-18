 --------- #1 Create Table from other tables (First Quarter)

 --Jan
CREATE TABLE january_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

--Feb
CREATE TABLE february_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;
--Mar
CREATE TABLE march_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;
