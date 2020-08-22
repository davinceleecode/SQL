DROP TABLE IF EXISTS #table1;
CREATE TABLE #table1(Department varchar(100), StartYear int, EmployeeCount int);

insert into #table1
SELECT 'Human Resources', 2006, 1
union all
SELECT 'Marketing', 2007, 1
union all
SELECT 'Production', 2007, 3
union all
SELECT 'Sales', 2007, 1
union all
SELECT 'Human Resources', 2008, 2
union all
SELECT 'Sales', 2008, 1
union all
SELECT 'Human Resources', 2009, 1
union all
SELECT 'Information Services', 2009, 2
union all
SELECT 'Marketing', 2009, 2
union all
SELECT 'Production', 2009, 2
union all
SELECT 'Sales', 2009, 1
union all
SELECT 'Production', 2010, 1
union all
SELECT 'Information Services', 2011, 1
union all
SELECT 'Sales', 2011, 1

SELECT *
FROM
(
SELECT	Department,
	    StartYear,
		SUM(EmployeeCount) as EmployeeCount
  FROM	
		#table1
		GROUP BY Department, StartYear
) t

PIVOT(
	SUM(EmployeeCount)
	FOR StartYear IN ([2006],[2007],[2008],[2009],[2010],[2011])
	) as pivot_table;
		
