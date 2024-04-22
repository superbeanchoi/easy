-- 행사 분야별 평균총예산 및 평균 행사규모등급, 진행횟수 조회
select 행사분야, 평균총예산, eg.es_g_code 평균행사규모등급, 행사진행횟수
from (select fc.ef_class_name "행사분야", floor(avg(ei.e_tot_budget)) "평균총예산", 
floor(avg(ei.e_capa)) "평균행사수용인원", count(*) "행사진행횟수"
from e_info ei, ed_class dc, ef_class fc
where fc.ef_class_code=dc.ef_class_code
and dc.ed_class_code=ei.ed_class_code
group by fc.ef_class_name) a, es_g eg
where 평균행사수용인원>=eg.mini_capa 
and 평균행사수용인원<=eg.maxi_capa
order by 1;