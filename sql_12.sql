-- ������Ŀ��� �η¾�ü���� ��ö���η¡� �׸��� ����ΰǺ���� 3% ������ ��, ����� ���ΰǺ� ��ȸ
select ei.e_name "����", lp.l_pay_code "�����ڵ�", c.cm_name "�ŷ�ó", li.ld_index "�η��׸�", 
li.ld_avg_cost "���� ����ΰǺ��", lp.l_tot_pay "���� ���ΰǺ�", 
li.ld_avg_cost*1.03 "�λ�� ����ΰǺ��", li.ld_avg_cost*1.03*ld.l_qt "����� ���ΰǺ�"
from cm c, l_pay lp, ls_d ld, ld_info li, ct_info ci, e_info ei
where ld.ls_d_code=lp.ls_d_code
and li.ld_code=ld.ld_code
and c.cm_code=li.cm_code
and ci.ct_code=ld.ct_code
and ei.e_code=ci.e_code
and lp.l_pay_ck='N'
and c.cm_name='����Ŀ����'
and li.ld_index='ö�� �η�';