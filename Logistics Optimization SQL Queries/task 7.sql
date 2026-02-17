
# 7.1 - average delay hours per source country
select r.source_country, avg(s.delay_hours) as avg_delay_hours
from dhl_routes r
join dhl_shipments s
on r.route_id = s.route_id
group by r.source_country;

# 7.2 - on time delivery percentage
select SUM(Delay_Reason = 'No Delay') * 100.0 / COUNT(*) AS on_time_delivery_percentage
from dhl_shipments;

# 7.3 - delivery delay in hours per route
select Route_ID, avg(Delay_Hours) as avg_delay_hours
from dhl_shipments
group by Route_ID;

select * from dhl_warehouses;

# 7.4 - Warehouse utilization percent
select s.warehouse_id,count(*) * 100 / w.Capacity_per_day as percent 
from dhl_shipments s
join dhl_warehouses w
on s.Warehouse_ID = w.Warehouse_ID
group by warehouse_id;


