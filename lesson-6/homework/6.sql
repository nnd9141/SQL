Puzzle 1: Finding Distinct Values

Question: Explain at least two ways to find distinct values based on two columns.

Solution 1: Using DISTINCT

We can use the DISTINCT keyword to fetch distinct combinations of values across both columns.

SELECT DISTINCT col1, col2
FROM InputTbl;


This query will return only unique combinations of col1 and col2, so any duplicate rows will be eliminated.

Solution 2: Using GROUP BY

We can also use GROUP BY to achieve the same result. It groups rows based on the values of col1 and col2 and ensures that only one row per distinct combination is returned.

SELECT col1, col2
FROM InputTbl
GROUP BY col1, col2;


Both queries will yield the following result:

col1	col2
a	b
c	d
m	n
Puzzle 2: Removing Rows with All Zeroes

Question: Remove rows where all columns contain zero values.

Solution:

We can use a WHERE clause to filter out rows where all the columns contain zero values.

SELECT A, B, C, D
FROM TestMultipleZero
WHERE NOT (A = 0 AND B = 0 AND C = 0 AND D = 0);


This query checks for rows where all columns (A, B, C, and D) have the value 0 and filters them out.

Result:
A	B	C	D
0	0	0	1
0	0	1	0
0	1	0	0
1	0	0	0
1	1	1	0

The fifth row (0, 0, 0, 0) is excluded.

Puzzle 3: Find those with odd IDs

Question: Find records where the id is odd.

Solution:

We can use the modulo operator (%) to check if the id is odd.

SELECT id, name
FROM section1
WHERE id % 2 = 1;


This query selects rows where the id is an odd number.

Result:
id	name
1	Been
3	Steven
5	Genryh
7	Fred
Puzzle 4: Person with the smallest ID

Question: Find the person with the smallest id.

Solution:

To find the smallest id, we can use ORDER BY and TOP 1.

SELECT TOP 1 id, name
FROM section1
ORDER BY id ASC;


This query returns the row with the smallest id.

Result:
id	name
1	Been
Puzzle 5: Person with the highest ID

Question: Find the person with the highest id.

Solution:

To find the highest id, we use ORDER BY in descending order and select the top row.

SELECT TOP 1 id, name
FROM section1
ORDER BY id DESC;

Result:
id	name
8	Andro
Puzzle 6: People whose name starts with "B"

Question: Find people whose name starts with the letter "B".

Solution:

We can use the LIKE operator to filter names that begin with the letter "B".

SELECT id, name
FROM section1
WHERE name LIKE 'B%';

Result:
id	name
1	Been
6	Bruno
Puzzle 7: Query to return only rows where the code contains an underscore (_)

Question: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).

Solution:

We can use the LIKE operator with an underscore as a literal by escaping it using square brackets or backslash.

SELECT Code
FROM ProductCodes
WHERE Code LIKE '%[_]%' ESCAPE '\\';


In this query, the underscore _ is treated as a literal because we escape it using the backslash (\).

Result:
Code
X_456
X_ABC

This query will return only the codes that contain the literal underscore (_) character.
