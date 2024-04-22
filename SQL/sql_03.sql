-- 진행여부가 ‘보류’인 행사 중 총예산이 가장 높은 행사 TOP3 조회
select e_name "행사명", e_tot_budget "총예산"
from(select e.e_name, e.e_tot_budget 
from e_info e
join go_ck g on e.go_ck_code=g.go_ck_code
where g.go_ckck='보류'
order by e.e_tot_budget desc)
where rownum<=3;