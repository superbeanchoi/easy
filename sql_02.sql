-- ������࿩�ΰ� '����'�� ��� �� ��ġ�� ��簳��Ƚ���� ���� ���� ���� TOP10 ��ȸ
select *
from (select a.e_loc "�����ġ", count(a.e_code) "��簳��Ƚ��", b.go_ckck "������࿩��"
from e_info a, go_ck b
where b.go_ckck=(select go_ckck from go_ck
where go_ckck='����' 
and a.go_ck_code=b.go_ck_code)
group by a.e_loc, b.go_ckck
order by 2 desc)
where rownum<=10;