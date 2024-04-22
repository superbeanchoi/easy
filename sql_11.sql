-- 행사 담당자별 최다 담당분야 및 해당분야 담당횟수 조회
select 행사담당자, 부서, 최다담당분야, 담당횟수
from (select emp.emp_name "행사담당자", d.dept_name "부서", ef.ef_class_name "최다담당분야", count(ef.ef_class_name) "담당횟수",
rank() over(partition by emp.emp_name order by count(ef.ef_class_name) desc) "순위"
from e_info ei, emp_info emp, dept d, ed_class ed, ef_class ef 
where emp.emp_code=ei.emp_code
and d.dept_code=emp.dept_code
and ed.ed_class_code=ei.ed_class_code
and ef.ef_class_code=ed.ef_class_code
group by emp.emp_name, d.dept_name, ef.ef_class_name)
where 순위=1
order by 4 desc;