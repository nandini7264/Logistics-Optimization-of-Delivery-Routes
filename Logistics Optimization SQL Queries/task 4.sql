SELECT * FROM dhl_warehouses;

# 4.1 - Top 3 warehouses with the highest average delay
select w.warehouse_id, s.Delivery_Status, avg(s.delay_hours) as delay
from dhl_warehouses as w
join dhl_shipments as s
on w.Warehouse_ID=s.Warehouse_ID
where s.Delivery_Status = 'In Transit'
group by warehouse_id
order by delay desc
limit 3;

# 4.2 - total shipments vs delayed shipments per warehouse
SELECT warehouse_id, count(*) as total_shipments, sum(Delay_Reason <> 'No Delay') as delayed_shipments
FROM dhl_shipments
GROUP BY warehouse_id;

# 4.3 - warehouses where avg_delay > global avg_delay
with avg_delay as
(select warehouse_id, avg(Delay_Hours) as Warehouse_delay
from dhl_shipments
group by warehouse_id)
select * from avg_delay where Warehouse_delay > (select avg(Delay_Hours) from dhl_shipments);

select avg(Delay_Hours) from dhl_shipments;

# 4.4 - Rank warehouses based on their on-time percentage
select warehouse_id, sum(Delay_Reason = 'No Delay') * 100 / count(*) as on_time_percentage
from dhl_shipments
group by warehouse_id
order by on_time_percentage;

