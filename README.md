# Introduction
This project is centered around the job market for data-specific job-seekers. Primarily on Data Analyst roles, the project uncovers top-paying jobs, the most demanded skills and where that demand meets high salary in data analytics.

SQL queries here: [project_sql folder](/project_sql/)
# Background
- This project was inspired by and builds off the SQL course offered via Luke Barousse ~ [SQL Course](https://lukebarousse.com/sql). 

### Questions I answered through my SQL queries
1. What are the highest compensated data analyst jobs?
2. What skills are required for these jobs ?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Git and GitHub**

# The Analysis

Each query builds off one another, ultimately to find insights related to Data Analyst jobs for optimal employment (high demand skills,high compensation)

### Query 1: Top Paying Data Anaylst Jobs (Remote)

The first query explores Data Analyst jobs specifically and the top salaries for said jobs, by company, that are remote. 



```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
**Quick insights:**
- **Highest paid roles (3):** The highest paid roles for this query were Data Analyst, Director of Analytics and Associate Director - Data Insights.

- **Salary range of highest paid roles:** The salary range of the three aformentioned roles was $255,829 to $650,000, with Associate Director being on the low end and Data Analyst being the highest.

- **Affiliated companies of these roles:** Manty's, Meta and AT&T were the companies paying out the most for a Data Analyst specific role


### Query 2: Skills Affiliated with Top Paying Jobs

The second query builds off the first, exploring what skills solicit the results of the top paying jobs in the first query.




```sql
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
**Quick insight:**



### Query 3: Most-demanded Skills for Data Analyst

The third query is similar to the second one, with a focus on top skills in demand for Data Analysts in general.


```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title = 'Data Analyst'
GROUP BY
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;
```
**Quick insight:**

### Query 4: Top Skills based on Salary 

Query Four is centered around the top skills based for Data Analysts, not specific to remote offerings.

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;
```
**Quick insight:**



### Query 5: The most optimal skills to learn (High demand and Pay)

The fifth query investigates the best skills to learn based on demand and pay.

```sql
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count>10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

**Quick insight:**

# What I learned

### Advanced SQL Query skills

- This course did an amazing job of going in depth on advance SQL topics such as CTE's, Unions, Case statements and using Joins amongst other topics. The refresher was well needed since graduating college and will help me in my current role as a consultant.

### Refresh on database orientation for SQL

- The beginning of this course highlights some important topics regarding tables in general and their orientation; including Primary Key explanation, Data Definition Language (DDL) knowledge and Data Manipulation Language (DML) knowledge.

### Git and Github

- As per this README file, I also learned briefly about Git and GitHub again and how to use repositories to pull and push code onto platforms.

