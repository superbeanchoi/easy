-- 결제 여부가 N인 결제 건 중 금일(2023/12/04) 기준 견적요청일이 2개월 이상 지난 건에 대한 거래처 및 거래처담당자 정보, 견적요청일자 조회
select l.l_pay_ck "결제여부", ei.e_name "행사명", o.cm_1st_name "거래처구분", c.cm_name "거래처", 
c.cm_repre_name "담당자", c.cm_repre_tel "담당자전화번호", d.ls_s_date "견적요청일"
from l_pay l, ls_d d, ld_info i, cm c, cm_2nd_class t, cm_1st_class o, ct_info ci, e_info ei
where l_pay_ck='N'
and d.ls_d_code=l.ls_d_code
and i.ld_code=d.ld_code
and c.cm_code=i.cm_code
and t.cm_2nd_code=c.cm_2nd_code
and o.cm_1st_code=t.cm_1st_code
and ci.ct_code=d.ct_code
and ei.e_code=ci.e_code
and d.ls_s_date<add_months(sysdate,-2)
group by ei.e_name, c.cm_name, c.cm_repre_name, c.cm_repre_tel, d.ls_s_date, l.l_pay_ck, o.cm_1st_name
union all
select r.ri_pay_ck "결제여부", ei.e_name "행사명", o.cm_1st_name "거래처구분", c.cm_name "거래처", 
c.cm_repre_name "담당자", c.cm_repre_tel "담당자전화번호", rd.rs_s_date "견적요청일"
from ri_pay r, rs_d rd, ri_info ri, cm c, cm_2nd_class t, cm_1st_class o, ct_info ci, e_info ei
where ri_pay_ck='N'
and rd.rs_d_code=r.rs_d_code
and ri.ri_code=rd.ri_code
and c.cm_code=ri.cm_code
and t.cm_2nd_code=c.cm_2nd_code
and o.cm_1st_code=t.cm_1st_code
and ci.ct_code=rd.ct_code
and ei.e_code=ci.e_code
and rd.rs_s_date<add_months(sysdate,-2)
group by ei.e_name, c.cm_name, c.cm_repre_name, c.cm_repre_tel, rd.rs_s_date, r.ri_pay_ck, o.cm_1st_name
order by 2, 7;