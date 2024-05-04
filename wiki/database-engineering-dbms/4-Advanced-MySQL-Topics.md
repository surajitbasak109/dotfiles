
Value => Function
Value => Procedure => Value

### MySQL Parameters
```mysql
CREATE PROCEDURE calculateTax(IN Salary DECIMAL(10, 2)) SELECT Salary * 0.2 AS TAX;
```

### User defined functions
User defined code => Task => Result

### Trigger works on
- INSERT: insert data in a table
- UPDATE: update data within a table
- DELETE: delete data from a table

### Scheduled event syntax
```mysql
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE AT CURRENT_TIMESTAMP [+ INTERVAL]
DO
Event_body
```

### Database optimization
Improving database performance to reduce the execution time of a query

### Optimizing database queries
```
Optimized               query
select          --------------------->              Database
statement       <---------------------
                        Result
```

### Secondary Index
Insert ----------------->

| Pointer | Data   |
|---------|--------|
| P1      | Record |
| P2      | Record |
| P3      | Record |
| P4      | Record |
| P5      | Record |

- START TRANSACTION
- BEGIN
- COMMIT
- ROLLBACK

### Syntax for a common table expression with multiple queries
```mysql
WITH
    cte1 AS (query1),
    cte2 AS (query2),
    cte3 AS (query3),
SELECT * FROM cte1
UNION
SELECT * FROM cte2
UNION
SELECT * FROM cte3
```

### MySQL Prepared statement
```mysql
PREPARE GetOrderStatement
FROM
    'SELECT ClientId, ProductID, Quantity, Cost
    FROM Orders
    WHERE OrderID = ?'
;
```

### MySQL JSON
```mysql
SELECT ActivityId, Properties->'$.ClientId', Properties->'$.ProductID'.
Properties->'$.Order' FROM Activity
```

### Database Analytics
- DESCRIPTIVE
- EXPLORATORY
- INFERENTIAL
- PREDICTIVE

### Stored procedures and functions
Wrap code within the body of a function or procedure for repeated use

- Consistency: Code is standardized
- Organization: Code is organized
- Reusability: Code can be used repeatedly

### Stored Procedure Syntax

```mysql
Create procredure GetProductDetails( )
SELECT * FROM Products

CALL GetProductDetails();
```

#### Function Syntax
```mysql
SELECT MOD(7, 5)
```

#### M&G and Functions
```mysql
select ClientID, ROUND(AVG(COST), 2)
FROM Orders
GROUP BY ClientID
```

**Variable Syntax**

```mysql
@variable_name = value;
```

**SET Command**

Assigns a value to a variable within a stored procedure

**Lucky Shrub and Variables**

```mysql
SET @order_id = 3;
```

```mysql
SELECT * FROM Orders WHERE OrderId = @order_id
```

**DECLARE command variables**

```mysql
DECLARE variable_name DATATYPE DEFAULT VALUE;
```

**Lucky Shrub and DECLARE commands**

```mysql
DECLARE minimum_order_cost DECIMAL(5, 2) DEFAULT 0;
```

**Assignment operator**

```mysql
:=
```

**Variables inside SELECT commands**

```mysql
SELECT @variable_name := value;
```

```mysql
SELECT @max_order := MAX(Cost) FROM Orders;
```

```mysql
SELECT @max_order;
```

```mysql
SELECT function() INTO variable_name FROM table_name;
```

```mysql
SELECT AVG(Cost) INTO @average_cost FROM Orders;
```

### Parameters
Pass arguments, or values to a function or procedure from the outside

**Types of Parameters**

- IN
- OUT
- INOUT

**IN Parameter**: Value => Procedure

**IN Parameter Syntax**

```mysql
CREATE PROCEDURE procedure_name(IN logic(value1, value2)) SELECT logic;
```

```mysql
CREATE PROCEDURE CalculateTax(IN Salary DECIMAL(10, 2)) SELECT Salary * 0.2 AS TAX;
```

```mysql
CALL CalculateTax(10000);
```

**OUT Parameter**: Value => Procedure => variable

**OUT Parameter Syntax**

```mysql
CREATE PROCEDURE GetLowestCost (OUT LowestCost DECIMAL(6, 2))
SELECT MIN(Cost) INTO LowestCost FROM Orders;
```

```mysql
CALL GetLowestCost(@order_lowest_cost);
```

```mysql
SELECT @order_lowest_cost;
```

**INOUT Parameter**: Value => Procedure => variable

**INOUT Parameter Syntax**

```mysql
CREATE PROCEDURE SquareANumber(INOUT aNumber INT)
BEGIN
    SET aNumber = aNumber * aNumber;
END
```

```mysql
SET @x_number = 5;
CALL SquareANumber(@x_number);
SELECT @x_number;
```

## User-Defined functions
Created to perform operations that can't be completed with built-in functions

User-defined code => Task => Result

**User-defined function syntax**

```mysql
CREATE FUNCTION function_name()
RETURNS datatype DETERMINISTIC
RETURN
```

**Lucky Shrub and User-defined functions**

```mysql
CREATE FUNCTION FindTotalCost(Cost DECIMAL(5, 2))
RETURNS DECIMAL (5, 2) DETERMINISTIC
RETURN (Cost - (Cost * 0.1));
```

```mysql
SELECT FindTotalCost(100)
```

**Create Orders table**:

```mysql
CREATE TABLE Orders (
    OrderID BIGINT PRIMARY KEY AUTO_INCREMENT,
    ClientID BIGINT NOT NULL,
    ProductID BIGINT NOT NULL,
    Quantity INT NOT NULL,
    Cost DECIMAL(9, 2) NOT NULL,
    Date DATE NOT NULL
);
```

```mysql
DELIMITER //
CREATE FUNCTION GetTotalCost(Cost DECIMAL(5, 2)) RETURNS DECIMAL(5, 2) DETERMINISTIC
    BEGIN
        IF (Cost >= 100 AND Cost < 500) THEN
            SET Cost = Cost - (Cost * 0.1);
        ELSEIF (Cost >= 500) THEN
            SET Cost = Cost - (Cost * 0.2);
        END IF;
        RETURN (Cost);
    END//
```

```mysql
SELECT GetTotalCost(500);
```

**To drop function**
```mysql
DROP FUNCTION GetTotalCost;
```

```mysql
DELIMITER //
CREATE PROCEDURE GetProductSummary(OUT NumberOfLowPriceProducts INT, OUT NumberOfHighPriceProducts INT)
BEGIN
    SELECT COUNT(ProductID) INTO NumberOfLowPriceProducts FROM Products WHERE Price < 50;
    SELECT COUNT(ProductID) INTO NumberOfHighPriceProducts FROM Products WHERE Price >= 50;
END //
```

Now Call the procedure and select those two variables
```mysql
DELIMITER ;
CALL GetProductSummary(@TotalNumberOfLowPriceProducts, @TotalNumberOfHighPriceProducts);
SELECT @TotalNumberOfLowPriceProducts, @TotalNumberOfHighPriceProducts;
```

**Output**

```
mysql> CALL GetProductSummary(@TotalNumberOfLowPriceProducts, @TotalNumberOfHighPriceProducts);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT @TotalNumberOfLowPriceProducts, @TotalNumberOfHighPriceProducts;
+--------------------------------+---------------------------------+
| @TotalNumberOfLowPriceProducts | @TotalNumberOfHighPriceProducts |
+--------------------------------+---------------------------------+
|                              3 |                               3 |
+--------------------------------+---------------------------------+
1 row in set (0.00 sec)
```

##### Create complex stored procedures in MySQL
- Creating complex stored procedures that require multiple statements

##### Now you know
- How to create complex procedures that require multiple statements

## What are MySQL Triggers

**Trigger**:

A set of actions available in the form of a stored program invoked when an event occurs

**Trigger works on**

- INSERT: insert data in a table
- UPDATE: update data within a table
- DELETE: delete data from a table

**CREATE MySQL Trigger**

MySQL syntax statement used to create a trigger

```mysql
CREATE TRIGGER trigger_name
TRIGGER TYPE
ON table_name FOR EACH ROW
BEGIN
    statement_one
    statement_two
END
```

**DROP MySQL Trigger**

MySQL syntax statement used to drop or delete a trigger

```mysql
DROP TRIGGER IF EXISTS schema_name.trigger_name
```

**NOTE**: If you drop or delete a table, the associated trigger also deleted by MySQL

**Lucky Shrub and MySQL triggers**

```mysql
CREATE TRIGGER ApprovalRequest
AFTER UPDATE
BEGIN
    statement_one
    statement_two
END
```

**Benefits of triggers**:

- **Keeping a log of records**: Useful for maintaining audit trails
- **Alternative to constraints**: Maintain data integrity and run tasks

**Types of MySQL triggers**

- **Row-level**: Trigger invoked for each row
- **Statement-level**: Trigger invoked for each statement

**Row-level**:

100 rows => 100 row-level triggers => Table

**Statement-level**:

100 rows => Single trigger => Table

**But how can you determine when a INSERT, UPDATE or DELETE trigger occurs?**

Classified as:

| BEFORE | AFTER |
|--------|-------|
| Trigger invoked before an action | Trigger invoked after an action |


| BEFORE INSERT | AFTER INSERT |
|--------|-------|
| Invoked before data is inserted | Invoked after data is inserted |


| BEFORE UPDATE | AFTER UPDATE |
|--------|-------|
| Invoked before data is updated | Invoked after data is updated |


| BEFORE DELETE | AFTER DELETE |
|--------|-------|
| Invoked before data is deleted | Invoked after data is deleted |

### Example of Lucky Shrub and MySQL trigger types

They want to impose a new constraint on their orders table. This new rule must state that no minus values can be inserted in the table's order quantity field.
So, Lucky Shrub can begin with the create trigger command they can name the trigger order quantity.

```mysql
CREATE TRIGGER OrderQtyCheck
BEFORE INSERT
ON Orders FOR EACH ROW
BEGIN
    IF NEW.orderQty < 0 THEN
    SET NEW.orderQty = 0;
    END IF;
END
```

Lucky Shrub want to maintain an audit trail of all updates made to their orders table with an after insert trigger they can send a log message from the orders table to the audits table each time a new order is inserted.

```mysql
CREATE TRIGGER LogNewOrderInsert
AFTER INSERT
ON Orders FOR EACH ROW
INSERT INTO Audits VALUES ('AFTER', 'A new order was inserted', 'INSERT')
```

The company also needs to create a log that captures the date and time and order record is deleted from the orders table. The can use an after delete trigger for this task.

```mysql
CREATE TRIGGER AfterDeleteOrder
AFTER DELETE
ON Orders FOR EACH ROW
INSERT INTO Audits
VALUES(
    'AFTER',
    CONCAT('Order', OLD.OrderID, 'was deleted at', CURRENT_TIME(), 'on', CURRENT_DATE()),
    'DELETE'
)
```

```
mysql> DELIMITER //
mysql> CREATE TRIGGER OrderQtyCheck BEFORE INSERT
    -> ON Orders
    -> FOR EACH ROW
    -> BEGIN
    -> IF
    -> NEW.Quantity < 0
    -> THEN
    -> SET NEW.Quantity = 0;
    -> END IF;
    -> END //
Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER ;
```

Let's see what happens if we want to store a negative value for Quantity field:

```mysql
mysql> INSERT INTO Orders (ClientID, ProductID, Quantity, Cost, Date)
VALUES (3, 5, -15, 400, '2020-09-14');
Query OK, 1 row affected (0.00 sec)

mysql> select * from Orders;
+---------+----------+-----------+----------+---------+------------+
| OrderID | ClientID | ProductID | Quantity | Cost    | Date       |
+---------+----------+-----------+----------+---------+------------+
|       1 |        1 |         1 |       10 |  500.00 | 2020-09-01 |
|       2 |        2 |         2 |        5 |  100.00 | 2020-09-05 |
|       3 |        3 |         3 |       20 |  800.00 | 2020-09-03 |
|       4 |        4 |         4 |       15 |  150.00 | 2020-09-07 |
|       5 |        3 |         3 |       10 |  450.00 | 2020-09-08 |
|       6 |        2 |         2 |        5 |  800.00 | 2020-09-09 |
|       7 |        1 |         4 |       22 | 1200.00 | 2020-09-10 |
|       8 |        3 |         1 |       15 |  150.00 | 2020-09-10 |
|       9 |        1 |         1 |       10 |  500.00 | 2020-09-12 |
|      10 |        2 |         2 |        5 |  100.00 | 2020-09-13 |
|      11 |        3 |         5 |        0 |  400.00 | 2020-09-14 |
+---------+----------+-----------+----------+---------+------------+
11 rows in set (0.00 sec)
```

To Delete this trigger from the schema:
```mysql
DELETE TRIGGER IF EXISTS lucky_shrub.OrderQtyCheck
```

##### Now You know
- How to create and drop triggers in databases

## Scheduled Events
When working with MySQL databases they'll often be tasks or events that must be completed at specific times like inserting data or generating reports with MySQL scheduled events you can make sure that these events occur at the scheduled time even if you're not present.

Lucky Shrub often make use of MySQL scheduled events, for example the finance department has just requested a report on all orders received this month. However, this report must be generated at 11:59 PM on the last day of the month. Lucky Shrub can use a one-time event to create this report. They can schedule their MySQL database to generate the report at the specified time and date before you find out how Lucky Shrub can create this event. Before that let's understand what MySQL schedule event is:

**Schedule Events**:

A task that takes place at a specific time according to a schedule.

| Names | Statements | Occurrence |
|-------|------------|------------|
| All events have unique names | Each event contains one or more SQL statements | Events can occur once or multiple times |

| One-time events | Recurring events |
|-----------------|------------------|
| Scheduled events that occur just once | Scheduled events that occur on a regular basis |
| Example: Inserting data into a table one hour from now | Example: Generating a weekly report from a database |

**MySQL CREATE EVENT statement**

Scheduled events are created using CREATE EVENT keywords

**Scheduled events syntax**

```mysql
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE schedule_logic
DO
Event_body
```

**One-time scheduled event syntax**:
```mysql
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE AT CURRENT_TIMESTAMP [+ INTERVAL]
DO
Event_body
```

**Lucky Shrub and one-time scheduled events syntax**

Lucky Shrub can use this syntax to generate a one-off revenue report 12 hours from now and they can create their event logic within a begin and end clause

```mysql
CREATE EVENT GenerateRevenueReport
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
    INSERT INTO ReportData (OrderID, ClientID, ProductID, Quantity, Cost, Date)
    SELECT *
    FROM Orders
    WHERE Date
    BETWEEN '2022-08-01' AND '2022-08-31';
END
```

**Recurring scheduled event syntax**
```mysql
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE
EVERY [+INTERVAL]
DO
Event_body
```

Can also be used using the starts and ends keywords
```mysql
CREATE EVENT [IF NOT EXISTS] event_name
ON SCHEDULE
EVERY Interval STARTS timestamp [+INTERRVAL] ENDS timestamp [+INTERVAL]
DO
Event_body
```

**Lucky Shrub and recurring scheduled event syntax**

Lucky Shrub can use the recurring event syntax to create a daily stock check event if the event identifies that some stock levels are too low it sends out an order to restock those items
```mysql
CREATE EVENT DailyReStock
ON SCHEDULE
EVERY 1 DAY
DO
BEGIN
    IF Products.NumberOfItems < 50 THEN
    UPDATE Products SET NumberOfItems = 50;
    END IF;
END
```

**Drop event syntax**

```mysql
DROP EVENT [IF EXISTS] event_name;
```
