-- ���࿩�ΰ� ���������� ��� �� ������Ʈ�� �����ϴ� ���� ����� �����ϴ� ��� ���� ��ȸ
select e.e_code "����ڵ�", e.e_name "����", r.ro_name "���ֱ��", e.e_tot_budget "�ѿ���", 
e.e_s_date "��������", e.e_e_date "���������"
from e_info e, go_ck g, ro_info r
where g.go_ck_code=e.go_ck_code
and r.ro_code=e.ro_code
and g.go_ckck='����'
and r.ro_name in (select r.ro_name
from bl b, ct_info c, e_info e, ro_info r
where c.ct_code=b.ct_code
and e.e_code=c.e_code
and r.ro_code=e.ro_code);