-- 행사코드가 10001~10020인 행사의 주관기관 조회
select b.e_code "행사코드", b.e_name "행사명", c.eh_code "기관코드", a.ro_name "주관기관"
from ro_info a, e_info b, eh_info c
where b.e_code=c.e_code 
and a.ro_code=c.ro_code
and b.e_code>=10001 and b.e_code<=10020
group by b.e_name, a.ro_name, b.e_code, c.eh_code
order by 1, 3;