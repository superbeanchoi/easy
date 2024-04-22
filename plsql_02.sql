-- 이익률별 평균 수용인원과 특정 행사에 대한 수용인원을 비교하여 평균보다 초과일 경우 ‘초과’, 미만일 경우 ‘여유’를 출력하는 함수
create or replace function f_compare_capacity
(p_ecode in number)
return varchar2
is
v_pcode pr_g.pr_g_code%type;
v_avgcapa e_info.e_capa%type;
v_capa e_info.e_capa%type;
begin
select p.pr_g_code into v_pcode
from e_info e, pr_g p
where e.e_tot_budget>=mini_tot_b
and e.e_tot_budget<=maxi_tot_b
and e.e_code=p_ecode;
select floor(avg(e.e_capa)) into v_avgcapa
from e_info e, pr_g p
where e.e_tot_budget>=mini_tot_b
and e.e_tot_budget<=maxi_tot_b
and p.pr_g_code=v_pcode
group by p.pr_g_code;
select e_capa into v_capa
from e_info 
where e_code=p_ecode;
if v_capa<v_avgcapa then
return '여유';
else 
return '초과';
end if;
end;
/