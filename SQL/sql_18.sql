-- �̹� ��(2023/12)�� ����� ����� �������Ⱓ �� �ѿ���, ��������, ���ͷ� ��ȸ
with event_info as (select ei.e_name "����", ei.e_s_date "��������", ei.e_e_date "���������", 
ei.e_e_date-ei.e_s_date+1||'��' "����Ⱓ", e_tot_budget "�ѿ���", pr_g_code "���ͷ�"
from e_info ei, pr_g pr, go_ck gc
where to_char(ei.e_s_date, 'yy/mm')='23/12'
and ei.e_tot_budget>=mini_tot_b and ei.e_tot_budget<=maxi_tot_b
and gc.go_ck_code=ei.go_ck_code
and gc.go_ckck!='����'
order by 1),
event_pay as (select "����", sum("�Ѱ����ݾ�") "��������"
from (select ei.e_name "����", sum(l_tot_pay) "�Ѱ����ݾ�", lp.l_pay_ck "��������"
from e_info ei, ct_info ci, ls_d ld, l_pay lp
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and to_char(ei.e_s_date, 'yy/mm')='23/12'
group by ei.e_name, lp.l_pay_ck
union all
select ei.e_name "����", sum(ri_tot_pay) "�Ѱ����ݾ�", rp.ri_pay_ck "��������"
from e_info ei, ct_info ci, rs_d rd, ri_pay rp
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and to_char(ei.e_s_date, 'yy/mm')='23/12'
group by ei.e_name, rp.ri_pay_ck
order by 1)
group by "����")
select evi.*, evp.��������
from event_info evi, event_pay evp
where evi.����=evp.����;