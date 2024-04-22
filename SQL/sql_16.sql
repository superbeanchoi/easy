-- �ݳ⵵(2023) �ŷ�ó�� �Ѱ��� Ƚ�� �� �Ѱ����ݾ� ��ȸ
select c1.cm_1st_name "�ŷ�ó�о�", cm.cm_name "�ŷ�ó", 
count(cm.cm_name) "2023 �Ѱ��� Ƚ��", sum(lp.l_tot_pay) "2023 �Ѱ����ݾ�"
from l_pay lp, ls_d ld, ld_info li, cm cm, cm_2nd_class c2, cm_1st_class c1
where ld.ls_d_code=lp.ls_d_code
and li.ld_code=ld.ld_code
and cm.cm_code=li.cm_code
and c2.cm_2nd_code=cm.cm_2nd_code
and c1.cm_1st_code=c2.cm_1st_code
and to_char(l_pay_date, 'yyyy')=2023 and l_pay_ck='Y' 
group by cm_name, c1.cm_1st_name
union all
select c1.cm_1st_name, cm.cm_name, 
count(cm.cm_name), sum(rp.ri_tot_pay)
from ri_pay rp, rs_d rd, ri_info ri, cm cm, cm_2nd_class c2, cm_1st_class c1
where rd.rs_d_code=rp.rs_d_code
and ri.ri_code=rd.ri_code
and cm.cm_code=ri.cm_code
and c2.cm_2nd_code=cm.cm_2nd_code
and c1.cm_1st_code=c2.cm_1st_code
and to_char(ri_pay_date, 'yyyy')=2023 and ri_pay_ck='Y' 
group by cm_name, c1.cm_1st_name
order by 1, 3 desc;