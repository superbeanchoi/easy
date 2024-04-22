-- 이번 달(2023/12)에 진행될 행사의 행사진행기간 및 총예산, 총지출비용, 이익률 조회
with event_info as (select ei.e_name "행사명", ei.e_s_date "행사시작일", ei.e_e_date "행사종료일", 
ei.e_e_date-ei.e_s_date+1||'일' "진행기간", e_tot_budget "총예산", pr_g_code "이익률"
from e_info ei, pr_g pr, go_ck gc
where to_char(ei.e_s_date, 'yy/mm')='23/12'
and ei.e_tot_budget>=mini_tot_b and ei.e_tot_budget<=maxi_tot_b
and gc.go_ck_code=ei.go_ck_code
and gc.go_ckck!='보류'
order by 1),
event_pay as (select "행사명", sum("총결제금액") "총지출비용"
from (select ei.e_name "행사명", sum(l_tot_pay) "총결제금액", lp.l_pay_ck "결제여부"
from e_info ei, ct_info ci, ls_d ld, l_pay lp
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and to_char(ei.e_s_date, 'yy/mm')='23/12'
group by ei.e_name, lp.l_pay_ck
union all
select ei.e_name "행사명", sum(ri_tot_pay) "총결제금액", rp.ri_pay_ck "결제여부"
from e_info ei, ct_info ci, rs_d rd, ri_pay rp
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and to_char(ei.e_s_date, 'yy/mm')='23/12'
group by ei.e_name, rp.ri_pay_ck
order by 1)
group by "행사명")
select evi.*, evp.총지출비용
from event_info evi, event_pay evp
where evi.행사명=evp.행사명;