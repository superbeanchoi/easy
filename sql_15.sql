-- 거래처별 견적요청일자와 실제결제일자 간 평균결제기간 조회
select o.cm_1st_name "거래처구분", c.cm_name "거래처", floor(avg(rp.ri_pay_date-rd.rs_s_date))||'일' "평균결제기간"
from ri_pay rp, rs_d rd, ri_info ri, cm c, cm_2nd_class t, cm_1st_class o
where rd.rs_d_code=rp.rs_d_code
and ri.ri_code=rd.ri_code
and c.cm_code=ri.cm_code
and t.cm_2nd_code=c.cm_2nd_code
and o.cm_1st_code=t.cm_1st_code
group by c.cm_name, o.cm_1st_name
union all
select o.cm_1st_name "거래처구분", c.cm_name "거래처", floor(avg(lp.l_pay_date-ld.ls_s_date))||'일' "평균결제기간"
from cm c, l_pay lp, ls_d ld, ld_info li, cm_2nd_class t, cm_1st_class o
where ld.ls_d_code=lp.ls_d_code
and li.ld_code=ld.ld_code
and c.cm_code=li.cm_code
and t.cm_2nd_code=c.cm_2nd_code
and o.cm_1st_code=t.cm_1st_code
group by c.cm_name, o.cm_1st_name
order by 3 desc;