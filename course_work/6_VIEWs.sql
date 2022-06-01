use geodata;

-- gettting the coordinates of the wells according to the last actual measurement
create view BEST_SITE_SUREY
as

with table1 as (
	select project, site_id, max(instance) 'instance'
	from site_survey
	group by project, site_id
)

select * from site_survey s inner join table1 t on s.project = t.project and s.site_id = t.site_id and s.instance = t.instance
;