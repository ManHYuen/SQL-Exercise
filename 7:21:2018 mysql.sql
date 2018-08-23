-- Dataset is LearningSQLExample.sql. It is from http://examples.oreilly.com/learningsql/.

-- 1.Select all last names from employee where the first letter is lowercase and all the other letters is uppercase.

SELECT CONCAT(LOWER(LEFT(lname, 1)),UPPER(SUBSTR(lname, 2))) AS last_name FROM employee;

-- 2.Select distinct customer id from account.

SELECT DISTINCT cust_id FROM account.

-- 3.Create a view from employee.

SELECT VIEW employee_view AS
SELECT emp_id, fname, lname,
YEAR(start_date) AS start_year
FROM employee;

-- 4. SELECT emp_id, start_year FROM employee_view sorted by start year descending;

SELECT emp_id, start_year
FROM employee_view ORDER BY start_year desc;

-- Exercise 3-1
-- Retrieve the employee ID, first name, and last name for all bank employees. Sort by last name and then by first name.

SELECT emp_id, fname, lname FROM employee ORDER BY lname, fname.

-- Exercise 3-2
-- Retrieve the account ID, customer ID, and available balance for all accounts whose status equals 'ACTIVE' and whose available balance is greater than $2500.

SELECT account_id, cust_id, avail_balance FROM account WHERE (status = 'ACTIVE' and avail_balance > 2500);

-- Exercise 3-3
-- Write a query against the account table that returns the IDs of the employees who opened the accounts (use the account.open_emp_id column). Include a single row for each distinct employee.

SELECT DISTINCT open_emp_id FROM account;

-- Exercise 3-4
-- Fill in the blanks (denoted by <'#'>) for this multi-data-set query to achieve the results shown here:

SELECT p.product_cd, a.cust_id, a.avail_balance
FROM product p INNER JOIN account <1>
ON p.product_cd = <2>
WHERE p.<3> = 'ACCOUNT'
ORDER BY <4>, <5>;
	
SELECT p.product_cd, a.cust_id, a.avail_balance
FROM product p INNER JOIN account a
ON p.product_cd = a.product_cd
WHERE p.product_type_cd = 'ACCOUNT'
ORDER BY product_cd, cust_id;

-- 4-1.Which of the transaction IDs would be returned by the following filter conditions?
txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100)

SELECT Txn_id FROM transaction
WHERE Txn_date < '2005-02-26' AND (Txn_type_cd = 'DBT' OR amount > 100);

-- 4-2.Which of the transaction IDs would be returned by the following filter conditions?
account_id IN (101, 103) AND NOT (txn_type_cd = 'DBT' OR amount > 100)

SELECT Txn_id FROM transaction
WHERE Account_id IN (101, 103) AND NOT (Txn_type_cd = 'DBT' OR amount > 100)

-- 4-3.Construct a query that retrieves all accounts opened in 2002.
SELECT * FROM account
WHERE YEAR(open_date) = '2002';

-- 4-4.Construct a query that finds all nonbusiness customers whose last name contains an a in the second position and an e anywhere after the a.

SELECT * FROM individual
WHERE lname LIKE '_a%e%'

-- 5-1.Fill in the blanks (donated by <>) for the following query to obtain the results that followL
SELECT e.emp_id, e.fname, e.lname, b.name
FROM employee e INNER JOIN <1> b
ON e.assigned_branch_id = b.<2>;

SELECT e.emp_id, e.fname, e.lname, b.name
FROM employee e INNER JOIN branch b
ON e.assigned_branch_id = b.branch_id;

-- 5-2.Write a query that returns the account ID for each nonbusiness customer (customer.cust_type_cd = 'I') with the customer_s federal ID (customer.fed_id) and the name of the product on which the account is based (product.name).

SELECT a.account_id, c.fed_id, p.name
FROM account a INNER JOIN product p
ON a.product_cd = p.product_cd
INNER JOIN customer c
ON a.cust_id = c.cust_id
WHERE c.cust_type_cd = 'I';

-- 5-3.Construct a query that finds all employees whose supervisor is assigned to a different department. Retrieve the employees ID, first name, and last name.

SELECT e.emp_id, e.fname, e.lname, e.dept_id, 'VS' vs, ed.emp_id, ed.fname, ed.lname, ed.dept_id
FROM employee e INNER JOIN employee ed
ON e.superior_emp_id = ed.emp_id
WHERE e.dept_id != ed.dept_id;


	

 

