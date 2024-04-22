-- 신규 결제 건 입력 시, 해당 행사의 총지출비용이 총수익을 초과할 경우, 오류 메시지를 반환하는 트리거
create or replace trigger t_pay
before insert on ri_pay
for each row
declare
v_ct_code rs_d.ct_code%type;
v_rsum ri_pay.ri_tot_pay%type;
v_lsum l_pay.l_tot_pay%type;
v_pay number;
v_e_code e_info.e_code%type;
v_budget e_info.e_tot_budget%type;
v_pr e_info.e_tot_budget%type;
begin
select ct_code into v_ct_code from rs_d where rs_d_code=:new.rs_d_code;
select sum(rp.ri_tot_pay) into v_rsum
from ct_info ci, e_info ei, rs_d rd, ri_pay rp
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code 
and rp.ri_pay_ck='N' 
and ci.ct_code=v_ct_code;
select sum(lp.l_tot_pay) into v_lsum
from ct_info ci, e_info ei, ls_d ld, l_pay lp
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code 
and lp.l_pay_ck='N' 
and ci.ct_code=v_ct_code;
v_pay:=v_rsum+v_lsum;
select e_code into v_e_code from ct_info where ct_code=v_ct_code;
select e_tot_budget into v_budget from e_info where e_code=v_e_code;
select ei.e_tot_budget*p.pr_g_code into v_pr
from e_info ei, pr_g p 
where ei.e_tot_budget>=p.mini_tot_b 
and ei.e_tot_budget<=p.maxi_tot_b
and ei.e_code=v_e_code;
if v_pr<=v_pay then
raise_application_error(-20040, '총 지출비용이 총수익을 초과합니다. 비용 견적을 재산출하세요.');
end if;
end;
/