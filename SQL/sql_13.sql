-- ���� �ֱٿ� ���� ����� IT �о� ��翡�� ���Ե� ��Ż ��ǰ �׸� ���� ��ȸ
select ee.ef_class_name "�о�", ee.ed_class_name "�󼼺з�", ee.e_name "����", 
cm.cm_name "��Ż�ŷ�ó", ri.ri_index "��ǰ�׸�", rd.ri_qt "���Լ���"
from (select * from (
select ef.ef_class_name, ed.ed_class_name, ei.e_code, e_name, e_s_date, e_e_date
from e_info ei, ed_class ed, ef_class ef, go_ck gc
where ef.ef_class_code=ed.ef_class_code
and ed.ed_class_code=ei.ed_class_code
and gc.go_ck_code=ei.go_ck_code
and ef.ef_class_name='IT'
and gc.go_ckck='����'
order by 4 desc)
where rownum=1) ee, ct_info ci, rs_d rd, ri_info ri, cm cm
where ee.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and ri.ri_code=rd.ri_code
and cm.cm_code=ri.cm_code
order by 4 asc, 6 desc;