-- �ֱ� 2�Ⱓ ���ֱ���� ������� Ƚ��, ����ѿ��� �� ������� ��ȸ
select to_char(e_info.e_s_date, 'yyyy') "���ֿ���", ro_info.ro_name "���ֱ��", 
count(e_info.e_code) "�������Ƚ��", avg(e_info.e_tot_budget) "����ѿ���"
from e_info
join ro_info on ro_info.ro_code=e_info.ro_code
where e_info.go_ck_code=204
and e_info.e_s_date>=add_months(trunc(sysdate),-24) 
group by to_char(e_info.e_s_date, 'yyyy'), ro_info.ro_name
order by 1, 2;