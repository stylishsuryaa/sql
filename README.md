# SQL Mastery & Relational Database Architecture

A structured repository containing normalized relational schemas, analytical queries, performance optimization techniques, and real-world case studies in MySQL.

---

## 📁 Repository Structure

- **`01-schema-design/`**: DDL scripts covering primary/foreign keys, constraints, and 1NF/2NF/3NF database normalization.
- **`02-dml-and-crud-operations/`**: Data manipulation operations, transactional safety, and batch record handling.
- **`03-joins-and-subqueries/`**: Multi-table relationships (`INNER`, `LEFT`, `RIGHT`), correlated subqueries, and nested data filtering.
- **`04-aggregations-and-grouping/`**: Grouping operations (`GROUP BY`, `HAVING`), window metrics, and revenue analytics.
- **`05-advanced-sql-objects/`**: Stored procedures, views, indexing strategies, and query optimization (`EXPLAIN`).
- **`case-studies/`**: End-to-end industry schemas (E-commerce order fulfillment & inventory tracking).

---

## 🛠️ Tech Stack & Tools
- **RDBMS:** MySQL / Oracle SQL
- **Concepts:** Relational Integrity, Indexing, Transaction Management (ACID), Schema Optimization

---

## 🚀 How to Run Locally

```bash
# Clone the repository
git clone [https://github.com/stylishsuryaa/sql.git](https://github.com/stylishsuryaa/sql.git)
cd sql

# Run any script directly in MySQL CLI
mysql -u root -p < case-studies/ecommerce_order_management.sql
