-- ��Ż ���� ��û ������ ����� ��, ��Ż ���� ��û���ڸ� '���� ����'�� �����ϴ� Ʈ����
create or replace trigger t_update_rdate
before update of ri_qt on rs_d
for each row
begin
:new.rs_s_date:=sysdate;
end;
/