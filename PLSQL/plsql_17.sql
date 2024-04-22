-- 행사명 입력 시, 총수익 대비 총 지출비용의 비율을 출력하는 함수
create or replace function f_ratio
(ecode in number)
return varchar2
is
v_gc e_info.go_ck_code%type;
v_ratio varchar2(50);
begin
select go_ck_code into v_gc from e_info where e_code=ecode;
if v_gc in (202, 204) then
select floor((sum(rp.ri_tot_pay)+sum(lp.l_tot_pay))/(e.e_tot_budget*p.pr_g_code)*100) into v_ratio
from e_info e, pr_g p, ct_info c, rs_d rd, ri_pay rp, ls_d ld, l_pay lp
where e.e_tot_budget<=maxi_tot_b
and e.e_tot_budget>=mini_tot_b
and e.e_code=c.e_code
and c.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and c.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and e.e_code=ecode
group by e.e_code, e.e_tot_budget*p.pr_g_code;
return v_ratio||'%';
elsif v_gc=203 then
return '취소된 행사건';
else
return '총지출 산출전';
end if;
end;
/