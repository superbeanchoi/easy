-- ����� ���Ե� ��� Ƚ�� ��ȸ
select emp_info.emp_name "�����", dept.dept_name "�μ�",
count(emp_input.emp_code) "�������Ƚ��"
from emp_input emp_input
join emp_info emp_info on emp_input.emp_code=emp_info.emp_code
join dept dept on dept.dept_code=emp_info.dept_code
group by dept.dept_name, emp_info.emp_name
order by 3 desc;