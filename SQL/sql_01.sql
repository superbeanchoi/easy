-- �ֱ� 3���� �� ������ ����� ��������� ���Ը��� �� ���������ο��� ��ȸ
select a.e_name "����", to_char(a.e_s_date, 'yyyy/mm') "�����", a.e_tot_budget "����ѿ���", 
(select b.es_g_code from es_g b 
where a.e_capa<=b.maxi_capa 
and a.e_capa>=b.mini_capa) "���Ը���", 
count(d.ct_code)||'��' "���������ο���"
from e_info a, ct_info c, emp_input d
where a.e_code=c.e_code
and c.ct_code=d.ct_code
and a.e_s_date>=add_months(sysdate,-3)
and a.e_s_date<=sysdate
and d.emp_code is not null
group by a.e_name, to_char(a.e_s_date, 'yyyy/mm'), a.e_tot_budget, a.e_capa, d.ct_code
order by 2;