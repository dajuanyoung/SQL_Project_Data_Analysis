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

Each query builds off one another, ultimately to find insights related to Data Analyst jobs for optimal employment (high demand skills~high compensation)

### Query 1: Top Paying Data Anaylst Jobs

The first query explores Data Analyst jobs specifically and the top salaries for said jobs, by company. 



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



# What I learned

### Advanced SQL Query skills

- This course did an amazing job of going in depth on advance SQL topics such as CTE's, Unions, Case statements and using Joins amongst other topics. The refresher was well needed since graduating college and will help me in my current role as a consultant.

### Refresh on database orientation for SQL

- The beginning of this course highlights some important topics regarding tables in general and their orientation; including Primary Key explanation, Data Definition Language (DDL) knowledge and Data Manipulation Language (DML) knowledge.

### Git and Github

- As per this README file, I also learned briefly about Git and GitHub again and how to use repositories to pull and push code onto platforms.

