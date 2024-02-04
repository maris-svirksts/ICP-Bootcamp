# SQL: Independent Work within Lecture.

## The Tasks
Task 1:
1. Use a SELECT statement to retrieve data from multiple columns across different tables.
2. Create a query that lists all orders sorted by the order date in descending order for a particular customer.
3. Write a query using JOIN to display customer names alongsides their respective order IDs.

NOTE: I don't have the schema for Task 1, so, writing the SQL queries for imaginary tables.

Task 2:
1. Optimize the column selection: Identify the necessary columns for the analysis of failed queries and modify the SELECT clause to retrieve only those columns.
2. Improve filtering: Assess if there are more specific criteria that could be applied to reduce the result set.
3. Review indexing: Determine if there are any indexes that the query could utilize to speed up the filtering process (Snowflake automatically manages micro-partitions, but understanding clustering keys may be relevant).
4. Query segmentation: If the result set is expected to be very large, consider if it would be beneficial to break the query into smaller segments.

## Task 1: The Result
```sql
SELECT t1.first, t2.second FROM table_1 AS t1, table_2 AS t2 WHERE t1.id = t2._id;
SELECT orders FROM order_table WHERE customer_id = 1 ORDER BY date DESC;
SELECT customer.name, ot.id FROM customer_table AS customer LEFT JOIN order_table AS ot ON customer.id = ot.customer_id;
```

## Task 2: The Result
```sql
-- Original SQL code.
/*SELECT *
FROM snowflake.account_usage.query_history
WHERE EXECUTION_STATUS = 'FAIL'
AND START_TIME >= DATEADD('day', -30, CURRENT_TIMESTAMP())
ORDER BY START_TIME DESC;*/

-- The fields selected would depend on the specific use case,
-- The days to get would depend on usecase as well. Using 7 as it's a very common amount of days.
-- The most expensive node in this case is 'SecureView [2]'. Recomendation would be
    -- to use an actual table instead of a view.
-- Depending on the usecase might add 'LIMIT 10' or 'TOP 10' to the SQL statement.
-- Date calculation from https://community.holistics.io/t/alternative-to-dateadd/890
-- TODO: check if I can see a certain amount of errors that belong to an error type instead of all of them.
SELECT ERROR_CODE, ERROR_MESSAGE, DATABASE_NAME, QUERY_TYPE,
    TOTAL_ELAPSED_TIME, QUERY_ID, QUERY_TEXT, START_TIME
FROM snowflake.account_usage.query_history
WHERE EXECUTION_STATUS = 'FAIL'
    AND START_TIME >= CURRENT_TIMESTAMP() - INTERVAL '7 day'
ORDER BY START_TIME DESC;
```