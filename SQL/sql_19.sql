-- ������ �������Ƚ�� �� ����ѿ���, ����Ѻ��, ����Ѽ��� ��ȸ
with avg_cost as (select ����, floor(sum(���������)) ����Ѻ��
from (select to_char(ei.e_s_date, 'yyyy') "����",avg(l_tot_pay) "���������"  -- �η�
from e_info ei, ct_info ci, ls_d ld, l_pay lp, go_ck gc
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and gc.go_ck_code=ei.go_ck_code
and gc.go_ckck in ('������', '����')
and lp.l_pay_ck='Y'
group by to_char(ei.e_s_date, 'yyyy')
union all
select to_char(ei.e_s_date, 'yyyy') "����", avg(ri_tot_pay) "���������"  -- ��Ż
from e_info ei, ct_info ci, rs_d rd, ri_pay rp, go_ck gc
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and gc.go_ck_code=ei.go_ck_code
and gc.go_ckck in ('������', '����')
and rp.ri_pay_ck='Y'
group by to_char(ei.e_s_date, 'yyyy'))
group by ����
order by 1),
avg_mon as (select eavg.*, pg.pr_g_code ������ͷ�
from (select to_char(ei.e_s_date, 'yyyy') "����", count(*) "���Ƚ��", floor(avg(ei.e_tot_budget)) "����ѿ���"
from e_info ei, ct_info ci, go_ck gc
where ei.e_code=ci.e_code
and gc.go_ckck in ('������', '����')
and gc.go_ck_code=ei.go_ck_code
group by to_char(ei.e_s_date, 'yyyy')) eavg, pr_g pg
where eavg.����ѿ���>=pg.mini_tot_b and eavg.����ѿ���<=pg.maxi_tot_b
order by 1)
select m.*, c.����Ѻ��, floor((����ѿ���*������ͷ�)) "����Ѽ���"
from avg_cost c, avg_mon m
where c.����=m.����;