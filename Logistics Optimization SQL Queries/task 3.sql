select * from dhl_routes;

# 3.1 - Average Transit Time across all shipments
select s.Shipment_ID, s.Route_ID, r.Avg_Transit_Time_Hours
from dhl_shipments s
join dhl_routes r
on s.Route_ID = r.Route_ID;

# 3.2 - average delay per route
select Route_ID, avg(Delay_Hours) as Delay
from dhl_shipments
group by Route_ID;

# 3.3 - calculate route-wise distance-to-time ratio
select route_id, distance_km/avg_transit_time_hours as dist_to_time
from dhl_routes;

# 3.4 - top 3 routes with lowest distance-to-time ratio
select route_id, distance_km/avg_transit_time_hours as dist_to_time
from dhl_routes
order by dist_to_time
limit 3;




