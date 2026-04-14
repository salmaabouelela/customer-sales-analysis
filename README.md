# Customer Sales Analysis & Business Insights

## Overview
This project analyzes retail sales data to uncover key business insights related to revenue performance, profitability, customer behavior, and regional trends. The analysis combines SQL and Python (Pandas, Matplotlib) to transform raw transactional data into actionable insights.

---

## Objective
The goal of this project is to support data-driven decision-making by:
- Evaluating overall business performance
- Identifying top-performing regions, categories, and customers
- Understanding the impact of discounts on profitability
- Analyzing sales trends over time

---

## Tools & Technologies
- Python (Pandas, NumPy, Matplotlib)
- SQL (MySQL)
- Google Colab
- Excel (data source)

---

## Dataset
The dataset contains retail transaction data including:
- Orders and dates
- Customer information
- Product categories and sub-categories
- Sales, profit, discount, and quantity

---

## Key KPIs

- **Total Revenue:** 2,297,200.86  
- **Total Profit:** 286,397.02  
- **Total Orders:** 5,009  
- **Total Customers:** 793  
- **Average Discount:** 16%  

---

## Key Insights

### Regional Performance
- The **West region** generated the highest sales and profit.
- The **East region** also performed strongly.
- The **Central region** had moderate sales but significantly lower profit.
- The **South region** recorded the lowest performance overall.

---

### Category Analysis
- **Technology** is the most profitable category.
- **Office Supplies** also contributes significantly to profit.
- **Furniture** generates high sales but very low profit, indicating low margins.

---

### Sub-Category Insights
- **Copiers and Phones** are the most profitable sub-categories.
- Some sub-categories (e.g., **Tables, Bookcases, Supplies**) generate **negative profit**, indicating loss-making products.

---

### Customer Analysis
- A small group of customers contributes a large share of total revenue.
- Example:
  - **Sean Miller** is the top customer by sales but generates **negative profit**, indicating unprofitable customer relationships.

---

### Shipping Analysis
- **Same Day shipping** is the fastest (0 days).
- **Standard Class** has the longest delivery time (5 days).
- Shipping performance varies significantly across modes.

---

### 📉 Discount Impact on Profit
- Low or no discount - high profit
- High discounts (30%–80%) - **negative profit**
- Discounts are a major driver of profitability loss

---

### Sales Trend Over Time
- Sales show clear fluctuations over time
- Peak sales observed in **late 2017**
- Indicates potential seasonality or growth trend

---

## Project Preview

### 📊 Sales by Region

<img width="630" height="470" alt="image" src="https://github.com/user-attachments/assets/d9c84d41-6505-4359-9a3d-54897404ab52" />


### 📊 Profit by Category

<img width="630" height="470" alt="image" src="https://github.com/user-attachments/assets/5dd2571e-9f1d-4b76-82d7-cd53bd988d95" />


### 📊 Top Customers


<img width="630" height="470" alt="image" src="https://github.com/user-attachments/assets/a00f4f6b-6d31-4085-8ce4-b07cb9f3f78d" />



### 📊 Monthly Sales Trend


<img width="630" height="470" alt="image" src="https://github.com/user-attachments/assets/1dfed76f-7ec7-4c80-9cf8-c32da0202c3a" />



### 📊 Profit by Discount


<img width="630" height="470" alt="image" src="https://github.com/user-attachments/assets/983af2bc-673e-4f62-b6bc-2e41ab89ed7d" />


---

## Files in This Repository

- `data/Sample - Superstore.xlsx` – Raw dataset  
- `sql/sql queries` – SQL queries for business analysis  
- `notebook/python code.ipynb` – Full Python analysis (Colab notebook)  

---

## Author
**Salma Sobhy**
