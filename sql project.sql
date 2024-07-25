
use demo308;



SELECT * FROM athletes;


-- count the total number of athletes
select count(*) as total_athletes from athletes;

-- show the unique countries participating
select distinct team as country from athletes;

-- find the number of gold medals won by each country
select team as country, count(*) as gold_medals
from athletes
where medal = 'Gold'
group by country;


-- show the average age of male and female athletes
select sex, avg(age) as avg_age
from athletes
group by sex;

-- display the youngest and oldest athletes
select *
from athletes
order by age asc
limit 1;

select *
from athletes
order by age desc
limit 1;


-- list the sports with the highest number of participants
select sport, count(*) as num_participants
from athletes
group by sport
order by num_participants desc
limit 5;

-- find the total number of medals won by each country
select team as country, count(*) as total_medals
from athletes
group by country;

-- show the average height of athletes by sport
select sport, avg(height) as avg_height
from athletes
group by sport;

-- display the number of athletes per year
select year, count(*) as num_athletes
from athletes
group by year;

-- list all athletes who won multiple medals
select athlete_name, count(*) as num_medals
from athletes
group by athlete_name
having count(*) > 1;

-- show the total number of medals won by each athlete
select athlete_name, count(*) as total_medals
from athletes
group by athlete_name
order by total_medals desc;

-- find the youngest gold medalist in each sport
select sport, min(age) as min_age
from athletes
where medal = 'Gold'
group by sport;

-- display the number of medals won by male and female athletes
select sex, count(*) as num_medals
from athletes
group by sex;

-- show the most common medals won by athletes
select medal, count(*) as num_medals
from athletes
group by medal
order by num_medals desc;

-- find the sports where athletes have won only gold medals
select sport
from athletes
group by sport
having count(distinct medal) = 1 and max(medal) = 'Gold';

-- display the number of athletes from each country
select team as country, count(*) as num_athletes
from athletes
group by country
order by num_athletes desc;

-- show the total number of gold medals won each year
select year, count(*) as gold_medals
from athletes
where medal = 'Gold'
group by year;

-- find the countries with the highest number of gold medals
select team as country, count(*) as gold_medals
from athletes
where medal = 'Gold'
group by country
order by gold_medals desc;

-- display the athletes who won medals in multiple sports
select athlete_name, count(distinct sport) as num_sports
from athletes
group by athlete_name
having count(distinct sport) > 1;

-- show the number of male and female athletes per country
select team as country, sex, count(*) as num_athletes
from athletes
group by country, sex;

-- find the most successful athlete in terms of total medals
select athlete_name, count(*) as total_medals
from athletes
group by athlete_name
order by total_medals desc
limit 1;

-- display the number of medals won by athletes from each continent
select continent, count(*) as num_medals
from athletes
group by continent;

-- show the number of medals won by athletes from each continent per year
select continent, year, count(*) as num_medals
from athletes
group by continent, year;

-- find the athletes who won gold medals in consecutive Olympic Games
select athlete_name, min(year) as first_year, max(year) as last_year
from athletes
where medal = 'Gold'
group by athlete_name
having count(distinct year)> 1;