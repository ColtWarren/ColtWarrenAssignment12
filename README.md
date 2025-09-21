# Pizza Restaurant Database

This project is a MySQL database design and implementation for a pizza restaurant.  
The goal of the assignment was to practice database normalization, relationships, and SQL queries.

---

## Requirements
- Customers can place multiple orders.
- Each order can contain multiple pizzas.
- The restaurant offers 4 types of pizzas:
  1. Pepperoni & Cheese ($7.99)
  2. Vegetarian ($9.99)
  3. Meat Lovers ($14.99)
  4. Hawaiian ($12.99)
- The system must track:
  - Customer name & phone number
  - Orders (with date/time)
  - Pizzas ordered (with quantities)
- Queries to calculate:
  - Total spending per customer
  - Total spending per customer per date
  - (Bonus) The top-spending customer

---

## Database Schema
The database consists of 4 tables:

- **customers** → customer info  
- **orders** → each customer order  
- **pizzas** → menu of available pizzas  
- **order_pizzas** → join table between orders and pizzas (with quantities)

---

## Example Queries
- **Total spent per customer  
- **Total spent per customer per date  
- **(Bonus)**: Find the top-spending customer  

---

## Customer	Phone	Total Spent
- Trevor Page	226-555-4982	50.96
- John Doe	555-555-9498	82.93

---

## Total spent per customer per date

# Customer Phone	Date	Total  Spent
Trevor Page	226-555-4982	2023-09-10	50.96
John Doe	555-555-9498	2023-09-10	39.97
John Doe	555-555-9498	2023-10-10	42.96


