-- ���о߰� ��ȯ�桯�� ����� �ѿ��� ��� ��������� ��Ÿ����� ���� ��ȸ
with etab as (select �о�, ����, �ѿ���, sum(�Ѱ����ݾ�) ��������, ��Ÿ�����
from (select fc.ef_class_name "�о�", ei.e_name "����", ei.e_tot_budget "�ѿ���", 
sum(ri_tot_pay) "�Ѱ����ݾ�", oc.other_cost "��Ÿ�����", rp.ri_pay_ck "��������"
from e_info ei, ct_info ci, rs_d rd, ri_pay rp, ed_class dc, ef_class fc, 
other_cost_info oc
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and fc.ef_class_code=dc.ef_class_code
and dc.ed_class_code=ei.ed_class_code
and ci.ct_code=oc.ct_code
and fc.ef_class_name='ȯ��'
and rp.ri_pay_ck='Y'
group by ei.e_name, fc.ef_class_name, rp.ri_pay_ck, ei.e_tot_budget, oc.other_cost
union all
select fc.ef_class_name "�о�", ei.e_name "����", ei.e_tot_budget "�ѿ���", 
sum(l_tot_pay) "�Ѱ����ݾ�", oc.other_cost "��Ÿ�����", lp.l_pay_ck "��������"
from e_info ei, ct_info ci, ls_d ld, l_pay lp, ed_class dc, ef_class fc, 
other_cost_info oc
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and fc.ef_class_code=dc.ef_class_code
and dc.ed_class_code=ei.ed_class_code
and ci.ct_code=oc.ct_code
and fc.ef_class_name='ȯ��'
and lp.l_pay_ck='Y'
group by ei.e_name, fc.ef_class_name, lp.l_pay_ck, ei.e_tot_budget, oc.other_cost
order by 1)
group by ����, �о�, �ѿ���, ��Ÿ�����)
select e.*, floor((e.��������/e.�ѿ���)*100)||'%' "�ѿ����� ���������", 
floor((e.��Ÿ�����/e.�ѿ���)*100)||'%' "�ѿ����� ��Ÿ�������"
from etab e;