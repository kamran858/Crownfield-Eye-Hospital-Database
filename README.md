# Crownfield Eye Hospital — Database Development

## Project Overview

This project was developed for the Introduction to Databases module. It demonstrates the design, implementation, testing and security of a relational database for a fictional eye hospital using MySQL.

The database contains nine related tables for managing patients, clinicians, clinics, appointments, diagnoses, prescriptions, medicines and follow-up plans.

## Requirements

- MySQL Community Server 8.x
- MySQL Workbench

## How to Run

1. Open MySQL Workbench and connect to your MySQL server.
2. Run `Kamran_01_schema.sql` to create the database and its tables.
3. Run `Kamran_02_additional_data.sql` to insert the additional fictional records.
4. Run `Kamran_Part_C_Queries.sql` to demonstrate the six SQL features.
5. Run `Kamran_Part_D_Security.sql` using an administrator account to demonstrate roles, permissions and security.

**Note:** `Kamran_03_constraint_tests.sql` contains tests that intentionally produce errors when invalid data is rejected. `Kamran_Part_D_Patient_Test.sql` should be run using the appropriate test account to demonstrate restricted permissions.

## SQL Files

| File | Purpose |
|---|---|
| `Kamran_01_schema.sql` | Database schema and table creation |
| `Kamran_02_additional_data.sql` | Additional fictional test records |
| `Kamran_03_constraint_tests.sql` | Database constraint testing |
| `Kamran_Part_C_Queries.sql` | SQL queries, stored procedure and trigger |
| `Kamran_Part_D_Security.sql` | Roles, permissions and security demonstrations |
| `Kamran_Part_D_Patient_Test.sql` | Patient access and permission testing |

## Entity Relationship Diagrams

The `05_ERD` folder contains the conceptual, logical and physical database diagrams.

## Data

All patient and clinical information in this project is fictional and used for educational purposes only.
