-- ���Ը��޺� ���ͷ��� ���� ��� TOP3�� ���� ������� ��ȸ
select ����, ��翬��, ���ֱ��, �ѿ���, ��ġ 
from (select e_info.e_name "����", to_char(e_info.e_s_date, 'yyyy') "��翬��", 
ro_info.ro_name "���ֱ��", e_info.e_tot_budget "�ѿ���", e_info.e_loc "��ġ"
from e_info e_info
join ro_info on e_info.ro_code=ro_info.ro_code
join es_g on e_info.e_capa between es_g.mini_capa and es_g.maxi_capa
order by e_info.e_tot_budget desc)
where rownum<=3;