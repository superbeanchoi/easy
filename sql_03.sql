-- ���࿩�ΰ� ���������� ��� �� �ѿ����� ���� ���� ��� TOP3 ��ȸ
select e_name "����", e_tot_budget "�ѿ���"
from(select e.e_name, e.e_tot_budget 
from e_info e
join go_ck g on e.go_ck_code=g.go_ck_code
where g.go_ckck='����'
order by e.e_tot_budget desc)
where rownum<=3;