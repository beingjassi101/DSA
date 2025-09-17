# Write your MySQL query statement below
select user_id, 
round(avg(case when activity_type='free_trial' then activity_duration end),2) as trial_avg_duration,
round(avg(case when activity_type='paid' then activity_duration end ),2) as paid_avg_duration
from useractivity
group by user_id
having user_id in (select distinct user_id from useractivity where activity_type='paid')
order by user_id;