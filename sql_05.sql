-- 행사규모등급별 이익률이 높은 행사 TOP3에 대한 행사정보 조회
select 행사명, 행사연도, 주최기관, 총예산, 위치 
from (select e_info.e_name "행사명", to_char(e_info.e_s_date, 'yyyy') "행사연도", 
ro_info.ro_name "주최기관", e_info.e_tot_budget "총예산", e_info.e_loc "위치"
from e_info e_info
join ro_info on e_info.ro_code=ro_info.ro_code
join es_g on e_info.e_capa between es_g.mini_capa and es_g.maxi_capa
order by e_info.e_tot_budget desc)
where rownum<=3;