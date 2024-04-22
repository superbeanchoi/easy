-- 사원별 투입된 행사 횟수 조회
select emp_info.emp_name "사원명", dept.dept_name "부서",
count(emp_input.emp_code) "투입행사횟수"
from emp_input emp_input
join emp_info emp_info on emp_input.emp_code=emp_info.emp_code
join dept dept on dept.dept_code=emp_info.dept_code
group by dept.dept_name, emp_info.emp_name
order by 3 desc;