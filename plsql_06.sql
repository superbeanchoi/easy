-- ��� ���ñ���� ��� ��ȭ��ȣ�� �Է� ��, �ش� ����� ��ġ�� ����ϴ� �Լ�
create or replace function f_location
(ro_tel in varchar2)
return varchar2
is
v_lonum varchar2(10);
begin
if instr(ro_tel,'-') > 0 then
v_lonum:=substr(ro_tel, 1, instr(ro_tel, '-') -1);
else v_lonum:=substr(ro_tel, 1, 3);
end if;
case v_lonum 
when '02' then return '����';
when '042' then return '����';
when '053' then return '�뱸';
when '051' then return '�λ�';
when '064' then return '����';
else return '�׿� ����';
end case;
end;
/