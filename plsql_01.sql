-- 사원 이름을 입력 시, 해당 사원이 가장 최근에 진행한 행사명 및 행사 시작일자를 출력하는 프로시저
create or replace procedure p_event(
v_saname in varchar2,
v_event out varchar2)
is
v_ename e_info.e_name%type; 
v_es_date e_info.e_s_date%type; 
begin
select e_name, e_s_date into v_ename, v_es_date
from (select e.e_name, ei.emp_name, e.e_s_date
from ct_info c, e_info e, emp_input ep, emp_info ei
where e.e_code=c.e_code
and c.ct_code=ep.ct_code
and ei.emp_code=ep.emp_code
and e.go_ck_code=204
and ei.emp_name=v_saname
union all
select e.e_name, ei.emp_name, e.e_s_date
from e_info e, emp_info ei
where e.emp_code=ei.emp_code
and e.go_ck_code=204
and ei.emp_name=v_saname
order by 3 desc)
where rownum=1;
v_event:=v_saname||' 사원이 가장 최근에 진행한 행사는 '||v_ename||' 이며, 해당 행사의 진행일자는 '||to_char(v_es_date, 'YYYY-MM-DD')||' 입니다.';
end;
/