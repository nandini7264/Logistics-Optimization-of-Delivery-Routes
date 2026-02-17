select * from dhl_shipments;

alter table dhl_shipments
add column calc_delay_hours int;

# 2.1 - calculate delivery delay in hours
update dhl_shipments
SET calc_delay_hours = TIMESTAMPDIFF(HOUR, Pickup_Date, Delivery_Date);

# 2.2 - top 10 delayed routes based on average delay hours
select route_id, avg(calc_delay_hours) as delay
from dhl_shipments
group by route_id
order by delay desc
limit 10;

# 2.3 - rank warehouses by delayed shipments
select Warehouse_ID, avg(calc_delay_hours) as delay,
rank() over (order by avg(calc_delay_hours)) as rnk
from dhl_shipments
group by warehouse_id;


# 2.4 - average delay per delivery_type
select o.Delivery_Type, avg(s.calc_delay_hours) as delay
from dhl_orders o
join dhl_shipments s
on o.Order_ID=s.Order_ID
group by o.Delivery_Type;

# presentation
select route_id,Warehouse_ID, avg(calc_delay_hours) as delay,
rank() over (order by avg(calc_delay_hours)) as rnk
from dhl_shipments
group by route_id,warehouse_id
limit 10;


