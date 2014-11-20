
create view vcalendar
as select CAST(D AS DATE) AS D, datename(month, d) as mon, datename(weekday, d) as day_name
from (select dateadd(day, u.n+10*t.n+100*h.n+1000*th.n, '2014-01-01') as d
from vten as th
     cross join vten as h
	 cross join vten as t
	 cross join vten as u)X;