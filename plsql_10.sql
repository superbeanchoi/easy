-- 행사명 입력 시, 지출금액이 가장 높은 렌탈거래처 및 인력거래처와 해당 금액 출력하는 프로시저
create or replace procedure p_cm_cost(
v_e_name in varchar2,
v_cm out varchar2)
is
v_max_lcm cm.cm_name%type;
v_max_lcost number;
v_max_rcm cm.cm_name%type;
v_max_rcost number;
begin
select cm_name, cm_tot into v_max_rcm, v_max_rcost
from (select ei.e_name, cm_name, sum(ri_tot_pay) cm_tot
from e_info ei, ct_info ci, rs_d rd, ri_pay rp, ri_info ri, cm cm
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and ri.ri_code=rd.ri_code
and cm.cm_code=ri.cm_code
and ei.e_name=v_e_name
and ri_pay_ck='Y'
group by ei.e_name, cm.cm_name
order by 3 desc)
where rownum=1;
select cm_name, cm_tot into v_max_lcm, v_max_lcost
from (select ei.e_name, cm_name, sum(l_tot_pay) cm_tot
from e_info ei, ct_info ci, ls_d ld, l_pay lp, ld_info li, cm cm
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and li.ld_code=ld.ld_code
and cm.cm_code=li.cm_code
and ei.e_name=v_e_name
and lp.l_pay_ck='Y'
group by ei.e_name, cm.cm_name
order by 3 desc)
where rownum=1;
v_cm:=v_e_name||' 에서 가장 총지출금액이 높은 렌탈거래처는 '||v_max_rcm ||', 인력거래처는 '||v_max_lcm||' 이며, 각각 총 지출금액은 렌탈은 '||v_max_rcost||' 원, 인력은 '||v_max_lcost|| ' 원 입니다.';
end;
/