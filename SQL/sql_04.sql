-- ��� �оߺ� ����ѿ��� �� ��� ���Ը���, ����Ƚ�� ��ȸ
select ���о�, ����ѿ���, eg.es_g_code ������Ը���, �������Ƚ��
from (select fc.ef_class_name "���о�", floor(avg(ei.e_tot_budget)) "����ѿ���", 
floor(avg(ei.e_capa)) "����������ο�", count(*) "�������Ƚ��"
from e_info ei, ed_class dc, ef_class fc
where fc.ef_class_code=dc.ef_class_code
and dc.ed_class_code=ei.ed_class_code
group by fc.ef_class_name) a, es_g eg
where ����������ο�>=eg.mini_capa 
and ����������ο�<=eg.maxi_capa
order by 1;