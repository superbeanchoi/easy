-- ��� ����ں� �ִ� ���о� �� �ش�о� ���Ƚ�� ��ȸ
select �������, �μ�, �ִٴ��о�, ���Ƚ��
from (select emp.emp_name "�������", d.dept_name "�μ�", ef.ef_class_name "�ִٴ��о�", count(ef.ef_class_name) "���Ƚ��",
rank() over(partition by emp.emp_name order by count(ef.ef_class_name) desc) "����"
from e_info ei, emp_info emp, dept d, ed_class ed, ef_class ef 
where emp.emp_code=ei.emp_code
and d.dept_code=emp.dept_code
and ed.ed_class_code=ei.ed_class_code
and ef.ef_class_code=ed.ef_class_code
group by emp.emp_name, d.dept_name, ef.ef_class_name)
where ����=1
order by 4 desc;