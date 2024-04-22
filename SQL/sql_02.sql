-- 행사진행여부가 '종료'인 행사 중 위치별 행사개최횟수가 가장 높은 지역 TOP10 조회
select *
from (select a.e_loc "행사위치", count(a.e_code) "행사개최횟수", b.go_ckck "행사진행여부"
from e_info a, go_ck b
where b.go_ckck=(select go_ckck from go_ck
where go_ckck='종료' 
and a.go_ck_code=b.go_ck_code)
group by a.e_loc, b.go_ckck
order by 2 desc)
where rownum<=10;