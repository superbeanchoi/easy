-- ���ñ�� �ű� �Է� ��, ���� �����ñ�� ���̺� �ߺ��� ��� ���� �޽����� ��ȯ�ϴ� Ʈ����
create or replace trigger t_ri
before insert on ro_info
for each row
declare
exist_cout number;
begin
select count(*) into exist_cout from ro_info
where ro_name=:new.ro_name or ro_tel=:new.ro_tel;
if exist_cout>0 then
raise_application_error(-20020, '�̹� �����ϴ� ������� �Դϴ�.');
end if;
end;
/