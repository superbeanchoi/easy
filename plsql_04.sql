-- 행사정보 테이블에서 총예산 정보 변경할 수 없으며, 변경 시도 시 오류 메시지를 반환하는 트리거
create or replace trigger t_ei_etb
after update of e_tot_budget on e_info
for each row
begin
raise_application_error(-20010, '총예산을 변경할 수 없습니다.');
end;
/