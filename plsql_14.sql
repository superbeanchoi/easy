-- 인력 견적 요청 인원이 변경될 시, 인력 결제 테이블의 총 결제 금액을 변경하는 트리거
create or replace trigger t_update_lpay
after update of l_qt on ls_d 
for each row
declare
begin
update l_pay set l_tot_pay=:new.l_qt*(
select ld_avg_cost
from ld_info where ld_code=:old.ld_code)
where ls_d_code=:new.ls_d_code;
end;
/