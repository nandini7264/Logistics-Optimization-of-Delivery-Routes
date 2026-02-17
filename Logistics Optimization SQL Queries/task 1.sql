# Task 1 
# 1.4 : defining datatypes and ensuring referential integrity

# dhl_delivery_agents
describe dhl_delivery_agents;

alter table dhl_delivery_agents
modify column Agent_ID varchar(50),
modify column Agent_Name varchar(255),
modify column Zone varchar(255),
modify column Zone_Country varchar(255),
modify column Experience_Years decimal(10,1),
modify column Avg_Rating decimal(10,1);

alter table dhl_delivery_agents
add primary key (Agent_ID);

# dhl_routes
describe dhl_routes;

alter table dhl_routes
modify column Route_ID varchar(50),
modify column Source_City varchar(255),
modify column Source_Country varchar(255),
modify column Destination_City varchar(255),
modify column Destination_Country varchar(255),
modify column Distance_KM int,
modify column Avg_Transit_Time_Hours decimal(10,1);

alter table dhl_routes
add primary key (Route_ID);

# dhl_orders
describe dhl_orders;

ALTER TABLE dhl_orders
MODIFY COLUMN Order_ID varchar(255),
MODIFY COLUMN Customer_ID varchar(255),
MODIFY COLUMN Order_Date DATETIME,
MODIFY COLUMN Route_ID varchar(255),
MODIFY COLUMN Warehouse_ID varchar(255),
MODIFY COLUMN Order_Amount DECIMAL(10,2),
MODIFY COLUMN Delivery_Type VARCHAR(50),
MODIFY COLUMN Payment_Mode VARCHAR(50);

alter table dhl_orders
add primary key (Order_ID);

alter table dhl_orders
add foreign key (Warehouse_ID) references dhl_warehouses(Warehouse_ID);

alter table dhl_orders
add foreign key (Route_ID) references dhl_routes(Route_ID);

# dhl_shipments
describe dhl_shipments;

alter table dhl_shipments
modify column Shipment_ID varchar(255),
modify column Order_ID varchar(255),
modify column Agent_ID varchar(255),
modify column Route_ID varchar(255),
modify column Warehouse_ID varchar(255),
modify column Pickup_Date datetime,
modify column Delivery_Date datetime,
modify column Delivery_Status varchar(255),
modify column Delay_Hours decimal(10,1),
modify column Delivery_Feedback varchar(255),
modify column Delay_Reason varchar(255),
modify column Expected_Delivery_Date datetime;

alter table dhl_shipments
add primary key (Shipment_ID);

alter table dhl_shipments
add foreign key (Order_ID) references dhl_orders(Order_ID);

alter table dhl_shipments
add foreign key (Agent_ID) references dhl_delivery_agents(Agent_ID);

alter table dhl_shipments
add foreign key (Route_ID) references dhl_routes(Route_ID);

alter table dhl_shipments
add foreign key (Warehouse_ID) references dhl_warehouses(Warehouse_ID);

# 1.1 : Remove duplicates - no duplicates found
SELECT Order_ID, COUNT(*)
FROM dhl_orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

SELECT Shipment_ID, COUNT(*)
FROM dhl_shipments
GROUP BY Shipment_ID
HAVING COUNT(*) > 1;

# 1.2 : Replace null values - no null values found
select * from dhl_shipments where Delay_Hours is null;

# 1.4 Ensure delivery_date comes after pickup_date
select * from dhl_shipments where Delivery_Date<Pickup_Date;




