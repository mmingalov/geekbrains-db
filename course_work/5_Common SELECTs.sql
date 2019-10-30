use geodata;

-- Сумма (метров) интервалов в скважине по каждому из литологических кодов
select L.project 'Месторождение', L.SITE_ID '№ Скважины', L.LITH 'Код', C.DESCRIPTION 'Описание', sum(L.depth_to - L.DEPTH_FROM) 'Всего метров'
from lithology L inner join lkp_code C on L.LITH = C.CODE and C.CATEGORY = 'lith_code'
group by L.project, L.SITE_ID, L.LITH, C.DESCRIPTION

--Координаты скважин (актуальные перезамеры) 
with table1 as (
	select project, site_id, max(instance) 'instance'
	from site_survey
	group by project, site_id
)
select * from site_survey s inner join table1 t on s.project = t.project and s.site_id = t.site_id and s.instance = t.instance
;