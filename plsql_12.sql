-- �ŷ�ó ���� �ű� �Է� ��, ���� �ŷ�ó ���̺� �ߺ��� ��� ���� �޽����� ��ȯ�ϴ� Ʈ����
create or replace trigger t_cm
before insert on cm
for each row
declare
v_count number;
begin
select count(*) into v_count from cm where cm_name=:new.cm_name;
if v_count=1 then
raise_application_error(-20030,'���� �ŷ�ó ���̺� �����ϴ� �ŷ�ó �����Դϴ�');
end if;
end;
/