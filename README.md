# 🚚 Logistics Optimization for Delivery Routes – DHL

---

## 📑 Table of Contents

- [Project Overview](#-project-overview)
- [Project Objective](#-project-objective)
- [Dataset Description](#-dataset-description)
- [Data Cleaning & Preparation](#-data-cleaning--preparation)
- [Delivery Delay Analysis](#-delivery-delay-analysis)
- [Route Optimization Insights](#-route-optimization-insights)
- [Warehouse Performance](#-warehouse-performance)
- [Delivery Agent Performance](#-delivery-agent-performance)
- [Shipment Tracking Analytics](#-shipment-tracking-analytics)
- [Advanced KPI Reporting](#-advanced-kpi-reporting)
- [Visualizations (Excel)](#-visualizations-excel)
- [Project Structure](#-project-structure)
- [PPT Presentation](#-ppt-presentation)
- [Conclusion](#-conclusion)


---

## 📌 Project Overview

This project analyzes DHL’s shipment and logistics data using SQL to uncover delay patterns, route inefficiencies, and operational bottlenecks.

The solution transforms relational database records into performance metrics and actionable logistics insights.

---

## 🎯 Project Objective

- Identify shipment delay drivers across routes and hubs.
- Optimize route and warehouse performance using SQL-based analytics.
- Strengthen on-time delivery and operational efficiency through KPI reporting.

---

## 📂 Dataset Description

This project integrates multiple relational datasets to analyze DHL’s shipment performance, operational efficiency, and delivery reliability.

### 1️⃣ Orders Table
Contains order-level transactional details including route, warehouse, order amount, delivery type, and payment mode.  
Used to analyze revenue contribution, delivery preferences, and route-level demand patterns.

### 2️⃣ Routes Table
Includes transportation details such as source/destination cities and countries, total distance (KM), and average expected transit time.  
Used to evaluate route efficiency, delay trends, and distance-to-time performance ratios.

### 3️⃣ Warehouses Table
Provides hub-level operational information including warehouse location, daily handling capacity, and management details.  
Used to assess shipment throughput, warehouse utilization, and dispatch performance.

### 4️⃣ Delivery Agents Table
Contains agent-level performance attributes such as assigned zone, experience (years), and average customer rating.  
Used to benchmark delivery performance and compare operational efficiency across agents.

### 5️⃣ Shipments (Tracking) Table
Captures shipment-level tracking data including pickup date, delivery date, delay hours, delivery status, and customer feedback.  
Used to compute delivery delays, on-time delivery percentage, route bottlenecks, and service-level adherence.

---

## 🧹 Data Cleaning & Preparation

- Removed duplicate Order_ID and Shipment_ID records and ensured referential integrity across related tables.
- Replaced missing Delay_Hours values using route-level averages and standardized datetime formats.
- Flagged records where Delivery_Date occurred before Pickup_Date for data validation.

---

## ⏱ Delivery Delay Analysis

- Calculated shipment-level delay using Delivery_Date – Pickup_Date.
- Identified top delayed routes and ranked shipments within each warehouse using window functions.
- Compared delay patterns between Express and Standard delivery types.

---

## 🚚 Route Optimization Insights

- Computed average transit time and average delay per route.
- Calculated distance-to-time efficiency ratio to evaluate route effectiveness.
- Identified low-efficiency routes and high-delay corridors for optimization focus.

---

## 🏭 Warehouse Performance

- Measured total vs delayed shipments per warehouse.
- Used CTE-based analysis to identify warehouses exceeding global average delay.
- Ranked warehouses by on-time delivery percentage.

---

## 👨‍✈️ Delivery Agent Performance

- Ranked agents by on-time delivery percentage per route.
- Identified agents below performance benchmarks.
- Compared ratings and experience between top and bottom performers.

---

## 📦 Shipment Tracking Analytics

- Extracted latest shipment status and timestamps.
- Identified routes with high proportions of delayed or returned shipments.
- Flagged shipments with extreme delays (>120 hours) for bottleneck investigation.

---

## 📊 Advanced KPI Reporting

- Calculated average delivery delay per source country and per route.
- Computed overall On-Time Delivery % using CASE-based aggregations.
- Measured warehouse utilization % based on shipment volume vs capacity.

---

## 📈 Visualizations (Excel)

- Exported SQL result sets into Excel for structured analysis.
- Created charts for delay trends, route efficiency, warehouse rankings, and KPI summaries.
- Used visual dashboards to support logistics optimization recommendations.

---

## 📁 Project Structure

```bash
Logistics-Optimization-DHL/
│
├── Data/
│   ├── DHL_delivery_agents.csv
│   ├── DHL_orders.csv
│   ├── DHL_routes.csv
│   ├── DHL_Shipments.csv
│   └── DHL_warehouses.csv
|
├── Logistics Optimization SQL Queries/
│   ├── Task1.sql
│   ├── Task2.sql
│   ├── Task3.sql
│   ├── Task4.sql
│   ├── Task5.sql
│   ├── Task6.sql
│   └── Task7.sql
│
├── Documentation/
│   └── Logistics optimization for delivery routes.pptx
│
└── README.md
```

---

## 📑 PPT Presentation

- Compiled SQL queries and result tables into a structured PowerPoint presentation.
- Included charts, performance comparisons, and KPI summaries.
- Concluded with data-backed route and efficiency optimization insights.

---

## 📌 Conclusion

This SQL-driven logistics analytics project converts shipment-level data into performance intelligence for DHL.

It demonstrates:

- Advanced SQL querying and window functions  
- Route and warehouse performance benchmarking  
- KPI-driven logistics evaluation  
- Data-backed operational optimization insights  
