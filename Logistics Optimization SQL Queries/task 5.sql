select * from dhl_delivery_agents;

# 5.1 - Delivery agents per route by on-time delivery percentage
create view delivery_percent as (
SELECT agent_id,route_id,SUM(Delay_Reason = 'No Delay') * 100.0 / COUNT(*) AS on_time_delivery_percentage
FROM dhl_shipments
GROUP BY agent_id, route_id);

SELECT agent_id,route_id,on_time_delivery_percentage,
RANK() OVER (PARTITION BY route_id ORDER BY on_time_delivery_percentage DESC ) AS rnk
FROM delivery_percent;

# 5.2 - agents whose on-time percent is below 85%
select agent_id,SUM(Delay_Reason = 'No Delay') * 100.0 / COUNT(*) AS on_time_delivery_percentage
from dhl_shipments
group by agent_id
having on_time_delivery_percentage < 85;

# 5.3 - top 5 vs bottom 5 agents
create view top_5_agent as 
select d.agent_id, d.Avg_Rating, d.Experience_Years, SUM(s.Delay_Reason = 'No Delay') * 100.0 / COUNT(*) AS on_time_delivery_percentage
from dhl_delivery_agents d
join dhl_shipments s
on d.agent_id = s.agent_id
GROUP BY d.agent_id, d.Avg_Rating, d.Experience_Years
order by on_time_delivery_percentage desc
limit 5;

create view bottom_5_agent as 
select d.agent_id, d.Avg_Rating, d.Experience_Years, SUM(s.Delay_Reason = 'No Delay') * 100.0 / COUNT(*) AS on_time_delivery_percentage
from dhl_delivery_agents d
join dhl_shipments s
on d.agent_id = s.agent_id
GROUP BY d.agent_id, d.Avg_Rating, d.Experience_Years
order by on_time_delivery_percentage 
limit 5;

SELECT * 
FROM top_5_agent
UNION ALL
SELECT * 
FROM bottom_5_agent;



