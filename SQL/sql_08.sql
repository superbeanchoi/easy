-- ����ڵ尡 10001~10020�� ����� �ְ���� ��ȸ
select b.e_code "����ڵ�", b.e_name "����", c.eh_code "����ڵ�", a.ro_name "�ְ����"
from ro_info a, e_info b, eh_info c
where b.e_code=c.e_code 
and a.ro_code=c.ro_code
and b.e_code>=10001 and b.e_code<=10020
group by b.e_name, a.ro_name, b.e_code, c.eh_code
order by 1, 3;