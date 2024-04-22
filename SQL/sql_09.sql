-- 주최기관과 주관기관이 동일한 행사 조회
select a.e_name "행사명", b.ro_name "주최기관", d.ro_name "주관기관"
from e_info a 
join ro_info b on a.ro_code=b.ro_code    
join eh_info c on a.e_code=c.e_code and b.ro_code=c.ro_code
join ro_info d on c.ro_code=d.ro_code 
group by a.e_name, b.ro_name, d.ro_name
order by 1;