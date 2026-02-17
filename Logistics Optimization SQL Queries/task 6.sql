select * from dhl_shipments;

# 6.1 - display latest status and delivery date for each shipment
select Shipment_ID, Delivery_Status, Delivery_Date from dhl_shipments; 

# 6.2 - Routes where majority shipments are in transit or returned
select route_id, sum(delivery_status in ('In Transit','Returned')) as in_transit, sum(delivery_status = 'Delivered') as delivered
from dhl_shipments
group by route_id
order by in_transit desc
limit 5;

# 6.3 - Most Frequent delay reasons
SELECT Delay_Reason, COUNT(*) AS shipment_count
FROM dhl_shipments
GROUP BY Delay_Reason;

# 6.4 - shipments with exceptionally high delay
select * from dhl_shipments
where Delay_Hours>120.00
order by Delay_Hours desc ;



