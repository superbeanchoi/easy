-- 행사분야가 ‘환경’인 행사의 총예산 대비 총지출비용과 기타사업비 비율 조회
with etab as (select 분야, 행사명, 총예산, sum(총결제금액) 총지출비용, 기타사업비
from (select fc.ef_class_name "분야", ei.e_name "행사명", ei.e_tot_budget "총예산", 
sum(ri_tot_pay) "총결제금액", oc.other_cost "기타사업비", rp.ri_pay_ck "결제여부"
from e_info ei, ct_info ci, rs_d rd, ri_pay rp, ed_class dc, ef_class fc, 
other_cost_info oc
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and fc.ef_class_code=dc.ef_class_code
and dc.ed_class_code=ei.ed_class_code
and ci.ct_code=oc.ct_code
and fc.ef_class_name='환경'
and rp.ri_pay_ck='Y'
group by ei.e_name, fc.ef_class_name, rp.ri_pay_ck, ei.e_tot_budget, oc.other_cost
union all
select fc.ef_class_name "분야", ei.e_name "행사명", ei.e_tot_budget "총예산", 
sum(l_tot_pay) "총결제금액", oc.other_cost "기타사업비", lp.l_pay_ck "결제여부"
from e_info ei, ct_info ci, ls_d ld, l_pay lp, ed_class dc, ef_class fc, 
other_cost_info oc
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and fc.ef_class_code=dc.ef_class_code
and dc.ed_class_code=ei.ed_class_code
and ci.ct_code=oc.ct_code
and fc.ef_class_name='환경'
and lp.l_pay_ck='Y'
group by ei.e_name, fc.ef_class_name, lp.l_pay_ck, ei.e_tot_budget, oc.other_cost
order by 1)
group by 행사명, 분야, 총예산, 기타사업비)
select e.*, floor((e.총지출비용/e.총예산)*100)||'%' "총예산대비 총지출비율", 
floor((e.기타사업비/e.총예산)*100)||'%' "총예산대비 기타사업비율"
from etab e;