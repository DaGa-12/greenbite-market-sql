# GreenBite Market — Business Analysis with SQL

A business analysis project using **MySQL, SQL, Pandas, and Matplotlib** to analyze transactional data from a fictional retail chain.

The project focuses on answering business questions related to customers, products, sales, employees, and branch performance through relational SQL analysis.

---

## Project Overview

GreenBite Market is a fictional retail chain that sells groceries and everyday products across multiple branches.

The objective of this project is to practice relational database analysis by transforming business questions into SQL queries and analyzing the resulting data.

The project covers:

* Customer purchasing behavior
* Product and category performance
* Sales by branch
* Employee and branch relationships
* Transaction-level analysis
* Business-oriented metrics

---

## Technologies

* **MySQL** — Relational database
* **SQL** — Data querying and analysis
* **Python** — Data analysis and visualization
* **Pandas** — Data extraction and tabular analysis
* **Matplotlib** — Data visualization
* **Jupyter Notebook** — Analysis environment
* **python-dotenv** — Environment variable management

---

## Project Structure

```text
greenbite-market-sql/
│
├── data/
│   ├── sql/
│   │   ├── database_setup.sql
│   │   ├── data_insertion.sql
│   │   └── business_analysis.sql
│   │
│   └── tables/
│       ├── branches.csv
│       ├── employees.csv
│       ├── customers.csv
│       ├── sales.csv
│       ├── sales_details.csv
│       ├── products.csv
│       └── categories.csv
│
├── notebooks/
│   ├── images/
│   │   ├── Result-Q1.jpg
│   │   ├── Result-Q2.jpg
│   │   └── ...
│   │
│   └── greenbite_business_analysis.ipynb
│
├── .env.example
├── .gitignore
└── README.md
```

---

## Database Structure

The database contains seven related tables:

| Table             | Description                    |
| ----------------- | ------------------------------ |
| `branches`      | Store branches                 |
| `employees`     | Employees assigned to branches |
| `customers`     | Customers                      |
| `sales`         | Sales transactions             |
| `sales_details` | Products included in each sale |
| `products`      | Product catalog                |
| `categories`    | Product categories             |

The database uses primary and foreign keys to establish relationships between entities.

```text
categories
    │
    └── products
             │
             └── sales_details
                       │
                       └── sales ─── customers
                              │
                              └── employees ─── branches
```

---

## Analysis

The analysis is documented in the Jupyter Notebook:

`notebooks/greenbite_business_analysis.ipynb`

The notebook contains **10 business questions**, with each analysis including:

1. Business question
2. SQL query
3. Query result
4. Data extraction using Pandas where applicable
5. Visualization where relevant

The analysis focuses on selecting the appropriate table relationships and aggregation level for each business question.

---

## Reproducibility

The project provides two ways to reproduce the database.

### Option 1 — Load the CSV files

The files inside `data/tables/` contain the raw data for each database table.

They can be imported into MySQL using tools such as the **MySQL Workbench Table Data Import Wizard**.

The expected loading order should respect the foreign key relationships between tables.

### Option 2 — Insert the data using SQL

The repository also includes SQL scripts for creating and populating the database.

Run the scripts in the following order:

```text
1. database_setup.sql
2. data_insertion.sql
3. business_analysis.sql
```

`database_setup.sql` creates the database structure and relationships.

`data_insertion.sql` inserts the data into the corresponding tables.

`business_analysis.sql` contains the SQL queries used for the business analysis.

---

## Environment Variables

The notebook uses environment variables to keep database credentials outside the source code.

Create a `.env` file in the project root based on `.env.example`:

```text
GREENBITE_DB_HOST=
GREENBITE_DB_PORT=
GREENBITE_DB_USER=
GREENBITE_DB_PASSWORD=
GREENBITE_DB_NAME=
```

The `.env` file should **not** be committed to the repository.

---

## Skills Demonstrated

* Relational database analysis
* Primary and foreign key relationships
* INNER JOIN
* LEFT JOIN
* Multiple-table joins
* GROUP BY
* Aggregate functions
* SUM()
* COUNT()
* COUNT(DISTINCT)
* Common Table Expressions (CTEs)
* ORDER BY
* LIMIT
* WHERE filtering
* Calculated metrics
* Multi-level aggregation
* Result-set granularity
* Translating business questions into SQL queries
