-- ‘리드커리어’ 인력업체에서 ‘철거인력’ 항목의 평균인건비용이 3% 증가할 시, 변경된 총인건비 조회
select ei.e_name "행사명", lp.l_pay_code "결제코드", c.cm_name "거래처", li.ld_index "인력항목", 
li.ld_avg_cost "기존 평균인건비용", lp.l_tot_pay "기존 총인건비", 
li.ld_avg_cost*1.03 "인상된 평균인건비용", li.ld_avg_cost*1.03*ld.l_qt "변경된 총인건비"
from cm c, l_pay lp, ls_d ld, ld_info li, ct_info ci, e_info ei
where ld.ls_d_code=lp.ls_d_code
and li.ld_code=ld.ld_code
and c.cm_code=li.cm_code
and ci.ct_code=ld.ct_code
and ei.e_code=ci.e_code
and lp.l_pay_ck='N'
and c.cm_name='리드커리어'
and li.ld_index='철거 인력';