-- 관련기관 신규 입력 시, 기존 행사관련기관 테이블에 중복될 경우 오류 메시지를 반환하는 트리거
create or replace trigger t_ri
before insert on ro_info
for each row
declare
exist_cout number;
begin
select count(*) into exist_cout from ro_info
where ro_name=:new.ro_name or ro_tel=:new.ro_tel;
if exist_cout>0 then
raise_application_error(-20020, '이미 존재하는 기관정보 입니다.');
end if;
end;
/