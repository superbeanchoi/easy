-- 행사 관련기관별 기관 전화번호를 입력 시, 해당 기관의 위치를 출력하는 함수
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
when '02' then return '서울';
when '042' then return '대전';
when '053' then return '대구';
when '051' then return '부산';
when '064' then return '제주';
else return '그외 지역';
end case;
end;
/