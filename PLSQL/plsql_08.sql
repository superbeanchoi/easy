-- 계약 성사 여부가 N으로 변경 시 계약파기일을 오늘로 변경, 행사 진행상태는 '취소'로 변경하는 트리거
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