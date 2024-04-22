-- 진행여부가 ‘보류’인 행사 중 블랙리스트에 존재하는 주최 기관이 주최하는 행사 정보 조회
select e.e_code "행사코드", e.e_name "행사명", r.ro_name "주최기관", e.e_tot_budget "총예산", 
e.e_s_date "행사시작일", e.e_e_date "행사종료일"
from e_info e, go_ck g, ro_info r
where g.go_ck_code=e.go_ck_code
and r.ro_code=e.ro_code
and g.go_ckck='보류'
and r.ro_name in (select r.ro_name
from bl b, ct_info c, e_info e, ro_info r
where c.ct_code=b.ct_code
and e.e_code=c.e_code
and r.ro_code=e.ro_code);