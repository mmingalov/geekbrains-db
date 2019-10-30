use geodata;

-- Получим координаты скважин по последнему актуальному замеру
create view BEST_SITE_SUREY
as

with table1 as (
	select project, site_id, max(instance) 'instance'
	from site_survey
	group by project, site_id
)

select * from site_survey s inner join table1 t on s.project = t.project and s.site_id = t.site_id and s.instance = t.instance
;