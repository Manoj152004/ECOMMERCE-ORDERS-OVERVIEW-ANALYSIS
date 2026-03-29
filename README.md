# E-Commerce Orders Overview Analysis

## Project Overview
End-to-end data analysis project on Indian e-commerce orders data covering
sales performance, customer location analysis, and returns & delivery insights.

**Tools Used:** Excel Power Query → Python (pandas) → PostgreSQL → Power BI

---

## Dataset
- **Source:** Synthetic Indian e-commerce orders dataset
- **Rows:** 4,030 orders
- **Columns:** 15 (order_id, customer_id, product_category, product_name,
  quantity, unit_price, discount_pct, revenue, payment_method, order_date,
  delivery_date, return_status, city, state, pincode)
- **Period:** 2023–2024

---

## Data Cleaning & Processing

### Excel Power Query
- Removed duplicate records
- Standardized column headers and data types
- Fixed inconsistent categorical values

### Python (pandas)
- Fixed mixed date formats in order_date and delivery_date columns
- Filled null values using appropriate imputation logic
- Removed remaining duplicates post-merge
- Exported clean dataset to CSV for PostgreSQL import

### PostgreSQL
- Imported clean data via SQLAlchemy
- Performed business analysis using SQL queries including:
  - Revenue by category and state
  - Return rate analysis
  - Monthly revenue trends
  - Top cities by order volume
  - Payment method breakdown

---

## Power BI Dashboard (3 Pages)

### Page 1 — Overview
- KPI Cards: Total Revenue (147M), Total Orders (2,690 filtered / 4,030 total),
  Total Quantity (7,880), Avg Order Value (55K)
- Line Chart: Total Revenue by Month
- Bar Chart: Sum of Revenue by State
- Slicers: Order Date (Year/Quarter), Product Category, Return Status

### Page 2 — Customer Location
- Bar Chart: Total Orders by City (Top cities: Bengaluru, Delhi, Kolkata)
- Donut Chart: Revenue by Payment Method
  (Credit Card 24.88% | UPI 14.76% | COD 14.04%)
- Waterfall Chart: Unique Customers by State
  (Maharashtra highest, Total = 4.0K)

### Page 3 — Returns & Delivery
- KPI Cards: Total Returned Orders (554), Total Orders (4,030)
- Bar Chart: Revenue by Product Category
  (Electronics and Mobiles highest)
- Pie Chart: Total Revenue by Year (2023: 35.43% | 2024: 64.57%)
- Line Chart: Avg Order Value by Month
- Gauge: Sum of Quantity (12K of 24K)

---

## Key Business Insights
- Electronics and Mobiles drive the highest revenue across all categories
- Maharashtra and Delhi are the top states by customer volume
- 2024 revenue (64.57%) significantly outperformed 2023 (35.43%)
- Credit Card is the dominant payment method at ~25% share
- 554 out of 4,030 orders were returned — 13.7% return rate
- Bengaluru leads all cities in total order volume

---

## DAX Measures
- Total Revenue
- Total Orders
- Total Returned Orders
- Avg Order Value
- Unique Customers
- Total Quantity
- Revenue Lost to Returns
- Avg Delivery Days
- Revenue per Customer
- MoM Revenue Change

---

## Repository Structure
ECOMMERCE-ORDER-ANALYSIS/
│
├── data/
│   └── ecommerce_orders_clean.csv
├── python/
│   └── cleaning.ipynb
├── sql/
│   └── analysis_queries.sql


├── dashboard/
│   └── ecommerce_dashboard.pbix

<img width="1366" height="768" alt="Screenshot (108)" src="https://github.com/user-attachments/assets/029a3ec8-6593-4279-8ae1-1e4713353ff6" />


<img width="1366" height="768" alt="Screenshot (109)" src="https://github.com/user-attachments/assets/7a21b738-1576-44e9-8166-28acd7d0d9bc" />

<img width="1366" height="768" alt="Screenshot (107)" src="https://github.com/user-attachments/assets/6b9fa242-ba6e-4268-8cfe-30b9698c79e8" />




└── README.md
