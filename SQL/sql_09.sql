-- ���ֱ���� �ְ������ ������ ��� ��ȸ
select a.e_name "����", b.ro_name "���ֱ��", d.ro_name "�ְ����"
from e_info a 
join ro_info b on a.ro_code=b.ro_code    
join eh_info c on a.e_code=c.e_code and b.ro_code=c.ro_code
join ro_info d on c.ro_code=d.ro_code 
group by a.e_name, b.ro_name, d.ro_name
order by 1;