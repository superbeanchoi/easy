-- ��� ���� ���ΰ� N���� ���� �� ����ı����� ���÷� ����, ��� ������´� '���'�� �����ϴ� Ʈ����
create or replace trigger t_event
before update of ct_stt on ct_info
for each row
begin
if :new.ct_stt='N' and :old.ct_stt='Y' then
:new.ct_cc_date:=sysdate;
update e_info set go_ck_code=203
where e_code=:new.e_code;
end if;
end;
/