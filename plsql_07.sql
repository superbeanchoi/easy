-- 주최기관별 행사개최 횟수에 따른 기관 VIP 등급(A등급~D등급)을 출력하는 함수
create or replace function f_vip
(code number)
return varchar2
is
v_event_count number;
begin
select count(*) into v_event_count 
from e_info e, go_ck g
where e.go_ck_code=g.go_ck_code and go_ckck in ('진행중', '종료')
and ro_code=code;
return case when v_event_count>=0 and v_event_count<3 then 'D'
when v_event_count>=3 and v_event_count<5 then 'C'
when v_event_count>=5 and v_event_count<8 then 'B'
else 'A' end;
end;
/