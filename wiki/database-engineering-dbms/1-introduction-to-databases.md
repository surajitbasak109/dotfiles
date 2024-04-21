https://www.youtube.com/watch?v=iwRneX7GIGI
Timestamp: 2:57:31

# Introduction to Databases

## Course Introduction
### Introduction to databases

#### Database
- A form of electronic storage in which data is held
- A database is a form of electronic storage in which data is organized systematically

#### Use cases
- **Banking sector** stores and manages customers, bank accounts and transactions.
- A **hospital** stores patient data, staff data, laboratory data and more.
- An **online store** retains profile information along with history history and accounting transactions.

#### Database collect and stores other items such like:
- Location data
- Duration on the platform
- connections with other users

Big Data, IoT(Internet of Things)

### Database tasks
- Store data
- Form relationships
- Filter the data
- Search data
- Perform CRUD operations

### Database course topics
- Data and database key concepts
- Forms of data relationships
- Different database structures and uses
- Create data
- Read data
- Update data
- Delete data
- SQL operator techniques
- Data  normalization concepts
- Data normalization techniques

### Course material
- Videos
- Course readings
- Exercises
- Knowledge quizzes
- Discussion prompts

## Databases and data
### What is database
1. Describe the concept of a database
2. Identify real-world examples of databases
3. Demonstrate an understanding of database organization

**Bank database**:

- Customers
- Bank accounts
- Transactions

**Hospital database**
- Patient data
- Staff data
- Lab data

**What does a database actually look like?**

A database looks like data organized systematically and this organization typically looks like a spreadsheet or a table.

**What exactly does the term systematic mean?**

All data contains elements or features and attributes by which they can be identified.
For example a person can be identified by attributes like their age, height or hair color.
And this data is separated and stored in entities that represent those elements.
An entity is like a table, it contains rows and columns that store data relating to a specific element. In other words these are relational elements. These entities could be physical representations like an employee, a customer or a product or they can be conceptual like an order, invoice or quotation.
entities then store data in a table like format against the attributes or features related to the element.

For example an online store could hold customers in a customer entity containing specific attributes relating to the customer. These attributes could include first name, last name, date of birth and email. And they could also have product data stored in a product entity against attributes like product code, description, price and availability.
In the relational database world these entities are known as relations or tables. The attributes become the columns of the table and each table row represents an instance of that entity.

#### Customer entity
| First name | Last name | Date of birth | Email |
|------------|-----------|---------------|-------|
| Sarah | Hogan | 1990-02-01 | shogan@email.com |
| Edris | Morgan | 1982-03-31 | emorgan@email.com |
| Jonathan | Duggan | 1995-06-22 | jduggan@email.com |
| Katrina | Langley | 1977-08-18 | Klangley@email.com |
| Mish | Taleb | 2022-04-30 | mtaleb@email.com |

#### Other types of databases
- Object oriented databases - Data stored in the form of objects
- Graph databases - Data stored in the form of nodes
- Document databases - Data stored as JSON(JavaScript object notation objects) objects

**But where are the databases themselves stored**
- Dedicated machine (Host a database on-site)
- Cloud hosting (Host a database on the cloud)

The most popular is cloud hosting. Because they allow you to store, manage and retrieve data through a cloud platform and access data through the internet. They all provide a lower cost option for data management than other similar options.

### How is data related?

After the end of the topic you will be able to:
1. Explain why data in a database should be related
2. Identify an instance of related data in a database

### Alternative types of databases
1. Identify different types of databases
2. Explain how databases have evolved in response to big data

#### Relational databases
Used for storing structured data in a tabular format

#### NoSQL databases
Provide a flexible structure for storing and scaling data
NoSQL databases are used by social media platforms, the IoT(Internet of Things), AI (Artificial Intelligence) and other applications that generate massive amounts of unstructured data.

#### Types of NoSQL databases
- Document databases
- Key-value databases
- Graph databases

#### Big data
Complex data that grows exponentially with time

Social media platforms, online shopping sites and other services generate massive amounts of data every second of the day as they capture the actions of billions of users around the world. And with the IoT, more and more devices are connected to the internet generating even more and more data. This is how complex data or big data is created. All this data is highly unstructured or semi-structured.

Traditional database systems could deal with structured data using tables, records and relationships. But big data is a whole new challenge.

**Types of data**

Combination of structured, semi-structured and unstructured data

**Data power**

More powerful than traditional data when solving problems.

**Data insights**

Provides unique insights to help improve decision making

#### Manufacturing sector
- Monitor equipment
- Review production
- Interact with customers
- Anticipate demand

#### Retail
- Meet demand
- Improve customer experience
- Learn about customer behavior
- Stay competitive

#### Telecommunications
- Plan investments
- Design new services
- Analyze service quality
- Plan business

#### Cloud hosting

- Lack of infrastucture, maintenance and storage costs
- Many services available
- More affordable solutions

#### Business Intelligence
Analyzing data and other information to make informed decisions

## Intro to SQL

### What is SQL?
To communicate with data in database we need structured query language which is commonly known as SQL or sequel for pronunciation.

Able to:
1. Explain what SQL is
2. Outline the role of SQL in databases

**CRUD Operations**: Create, read, update and delete data

**SQL**: Standard language that can interact with structured data on databases

### SQL and relational databases
- MySQL
- PostgreSQL
- Oracle
- Microsoft SQL Server

**Database Management System**: Changes SQL instructions into a form understood by the database

### SQL usage
Able to:
1. Explain common SQL tasks
2. Understand SQL subsets and sublanguages

#### SQL subsets
- Data definition language or DDL
- Data manipulation language or DML
- Data query language or DQL
- Data control language or DCL

**DDL Create Command**: Used to create storage objects in a database, like tables

**DDL Alter command**: Modify the structure of a table object in a database

**DDL Drop command**: Remove an existing object from a database

Most CRUD operations are fall under **DML** or data manipulation language.

**DML Insert command**: Insert records of data into a database table

**DML update command**: Edit data that already exists in a database table

**DML Delete command**: Delete one or more rows of data from a table

**DQL Select command**: `SELECT column1, column2 FROM table;`

**DCL**: Control access to the database: `GRUNT` or `REVOKE`

### Advantage of SQL

Able to:
1. Identify the advantages of SQL
2. Demonstrate how the advantages of SQL assist with database tasks

SQL is an interface or a bridge between relational database and users.

The biggest advantage:
- **User-friendly**: SQL requires very little coding skill to use
- **Standard language**: Compatible with all available relational databases
- **Portable language**: SQL can be used on any hardware running any operating system

#### Advantages of SQL
- Create databases
- Insert, update and delete data
- Retrieve and share data
- Manage database security

**Data processing**: SQL processes large amounts of data quickly and efficiently

### SQL syntax introduction
Able to:
1. Create a database and tables using the DDL subset of SQL
2. Utilize the DML subset of SQL to populate and modify data in a database
3. Read and query data within databases using the DQL subset of SQL

## Basic Database Structure
### What are tables in databases?


