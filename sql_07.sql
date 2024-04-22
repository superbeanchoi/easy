-- 최근 2년간 주최기관별 행사진행 횟수, 평균총예산 및 기관정보 조회
select to_char(e_info.e_s_date, 'yyyy') "주최연도", ro_info.ro_name "주최기관", 
count(e_info.e_code) "행사진행횟수", avg(e_info.e_tot_budget) "평균총예산"
from e_info
join ro_info on ro_info.ro_code=e_info.ro_code
where e_info.go_ck_code=204
and e_info.e_s_date>=add_months(trunc(sysdate),-24) 
group by to_char(e_info.e_s_date, 'yyyy'), ro_info.ro_name
order by 1, 2;