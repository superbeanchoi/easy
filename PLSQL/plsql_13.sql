-- 렌탈 견적 요청 수량이 변경될 시, 렌탈 견적 요청일자를 '오늘 일자'로 변경하는 트리거
create or replace trigger t_update_rdate
before update of ri_qt on rs_d
for each row
begin
:new.rs_s_date:=sysdate;
end;
/