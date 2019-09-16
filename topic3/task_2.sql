/*������������ ������� ���� ���������� �������*/

/* ������� 1
 * 
 * ����������� ������� ������� ������������� � ������� users*/
select avg(year(current_date)-year(birthday_at))
from users;


/* ������� 2
 * 
 * ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
  ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.*/
with T as (
select dayname(birthday_at) as DAYNAME_DOB,
	birthday_at as DOB,
	year(current_date) - year(birthday_at) as YEARS_DIFF, 
	date_add(birthday_at, interval (year(current_date) - year(birthday_at)) YEAR) as DOB_THISYEAR,
	dayname(date_add(birthday_at, interval (year(current_date) - year(birthday_at)) YEAR)) as DAYNAME_DOB_THISYEAR
from users)

select DAYNAME_DOB_THISYEAR, count(DAYNAME_DOB_THISYEAR)
from T
group by DAYNAME_DOB_THISYEAR;

/* ������� 3 (�� �������) 
 * ����������� ������������ ����� � ������� �������*/

SELECT EXP(SUM(LOG(id))) FROM users;

