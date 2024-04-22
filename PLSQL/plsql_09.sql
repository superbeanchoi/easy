-- 행사시작 2주 전, 계약을 파기한 계약 건을 블랙리스트로 등록해두는 트리거
create or replace trigger t_bl
before update of ct_stt on ct_info
for each row
declare
v_ckcode e_info.go_ck_code%type;
v_date e_info.e_s_date%type;
begin
select go_ck_code, e_s_date into v_ckcode, v_date from e_info where e_code=:new.e_code;
if :new.ct_stt='N' and :old.ct_stt='Y' 
and v_ckcode!=205
and sysdate<=v_date and sysdate>=(v_date-14) then
insert into bl(bl_code, ct_code, bl_up_d)
values(seq_bl.nextval, :new.ct_code, sysdate);	
end if;
end;
/