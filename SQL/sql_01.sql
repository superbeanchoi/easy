-- 최근 3개월 내 진행한 행사의 행사정보와 행사규모등급 및 내부투입인원수 조회
select a.e_name "행사명", to_char(a.e_s_date, 'yyyy/mm') "행사년월", a.e_tot_budget "행사총예산", 
(select b.es_g_code from es_g b 
where a.e_capa<=b.maxi_capa 
and a.e_capa>=b.mini_capa) "행사규모등급", 
count(d.ct_code)||'명' "내부투입인원수"
from e_info a, ct_info c, emp_input d
where a.e_code=c.e_code
and c.ct_code=d.ct_code
and a.e_s_date>=add_months(sysdate,-3)
and a.e_s_date<=sysdate
and d.emp_code is not null
group by a.e_name, to_char(a.e_s_date, 'yyyy/mm'), a.e_tot_budget, a.e_capa, d.ct_code
order by 2;