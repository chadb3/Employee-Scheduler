select cast(c.d as date) d, e.first_name, case
    when r.[date] is null then 'Here'
	else 'RO'
	end as present
from vcalendar c
     cross join BasicEmployeeData e
	 left join RequestedDaysOff r
	 on r.emp_id = e.emp_id
	 and r.[date] = cast(c.d as date)
where c.d >= getdate()
and c.d <= dateadd(month, 1, getdate())
order by c.d, e.first_name