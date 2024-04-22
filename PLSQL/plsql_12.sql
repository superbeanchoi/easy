-- 거래처 정보 신규 입력 시, 기존 거래처 테이블에 중복될 경우 오류 메시지를 반환하는 트리거
create or replace trigger t_cm
before insert on cm
for each row
declare
v_count number;
begin
select count(*) into v_count from cm where cm_name=:new.cm_name;
if v_count=1 then
raise_application_error(-20030,'기존 거래처 테이블에 존재하는 거래처 정보입니다');
end if;
end;
/