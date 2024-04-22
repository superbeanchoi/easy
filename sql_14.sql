-- ���� ���ΰ� N�� ���� �� �� ����(2023/12/04) ���� ������û���� 2���� �̻� ���� �ǿ� ���� �ŷ�ó �� �ŷ�ó����� ����, ������û���� ��ȸ
select l.l_pay_ck "��������", ei.e_name "����", o.cm_1st_name "�ŷ�ó����", c.cm_name "�ŷ�ó", 
c.cm_repre_name "�����", c.cm_repre_tel "�������ȭ��ȣ", d.ls_s_date "������û��"
from l_pay l, ls_d d, ld_info i, cm c, cm_2nd_class t, cm_1st_class o, ct_info ci, e_info ei
where l_pay_ck='N'
and d.ls_d_code=l.ls_d_code
and i.ld_code=d.ld_code
and c.cm_code=i.cm_code
and t.cm_2nd_code=c.cm_2nd_code
and o.cm_1st_code=t.cm_1st_code
and ci.ct_code=d.ct_code
and ei.e_code=ci.e_code
and d.ls_s_date<add_months(sysdate,-2)
group by ei.e_name, c.cm_name, c.cm_repre_name, c.cm_repre_tel, d.ls_s_date, l.l_pay_ck, o.cm_1st_name
union all
select r.ri_pay_ck "��������", ei.e_name "����", o.cm_1st_name "�ŷ�ó����", c.cm_name "�ŷ�ó", 
c.cm_repre_name "�����", c.cm_repre_tel "�������ȭ��ȣ", rd.rs_s_date "������û��"
from ri_pay r, rs_d rd, ri_info ri, cm c, cm_2nd_class t, cm_1st_class o, ct_info ci, e_info ei
where ri_pay_ck='N'
and rd.rs_d_code=r.rs_d_code
and ri.ri_code=rd.ri_code
and c.cm_code=ri.cm_code
and t.cm_2nd_code=c.cm_2nd_code
and o.cm_1st_code=t.cm_1st_code
and ci.ct_code=rd.ct_code
and ei.e_code=ci.e_code
and rd.rs_s_date<add_months(sysdate,-2)
group by ei.e_name, c.cm_name, c.cm_repre_name, c.cm_repre_tel, rd.rs_s_date, r.ri_pay_ck, o.cm_1st_name
order by 2, 7;