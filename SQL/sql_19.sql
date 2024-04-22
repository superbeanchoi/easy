-- ø¨µµ∫∞ «‡ªÁ¡¯«‡»Ωºˆ π◊ ∆Ú±’√—øπªÍ, ∆Ú±’√—∫ÒøÎ, ∆Ú±’√—ºˆ¿Õ ¡∂»∏
with avg_cost as (select ø¨µµ, floor(sum(∆Ú±’¡ˆ√‚∫ÒøÎ)) ∆Ú±’√—∫ÒøÎ
from (select to_char(ei.e_s_date, 'yyyy') "ø¨µµ",avg(l_tot_pay) "∆Ú±’¡ˆ√‚∫ÒøÎ"  -- ¿Œ∑¬
from e_info ei, ct_info ci, ls_d ld, l_pay lp, go_ck gc
where ei.e_code=ci.e_code
and ci.ct_code=ld.ct_code
and ld.ls_d_code=lp.ls_d_code
and gc.go_ck_code=ei.go_ck_code
and gc.go_ckck in ('¡¯«‡¡ﬂ', '¡æ∑·')
and lp.l_pay_ck='Y'
group by to_char(ei.e_s_date, 'yyyy')
union all
select to_char(ei.e_s_date, 'yyyy') "ø¨µµ", avg(ri_tot_pay) "∆Ú±’¡ˆ√‚∫ÒøÎ"  -- ∑ª≈ª
from e_info ei, ct_info ci, rs_d rd, ri_pay rp, go_ck gc
where ei.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and rd.rs_d_code=rp.rs_d_code
and gc.go_ck_code=ei.go_ck_code
and gc.go_ckck in ('¡¯«‡¡ﬂ', '¡æ∑·')
and rp.ri_pay_ck='Y'
group by to_char(ei.e_s_date, 'yyyy'))
group by ø¨µµ
order by 1),
avg_mon as (select eavg.*, pg.pr_g_code ∆Ú±’¿Ã¿Õ∑¸
from (select to_char(ei.e_s_date, 'yyyy') "ø¨µµ", count(*) "«‡ªÁ»Ωºˆ", floor(avg(ei.e_tot_budget)) "∆Ú±’√—øπªÍ"
from e_info ei, ct_info ci, go_ck gc
where ei.e_code=ci.e_code
and gc.go_ckck in ('¡¯«‡¡ﬂ', '¡æ∑·')
and gc.go_ck_code=ei.go_ck_code
group by to_char(ei.e_s_date, 'yyyy')) eavg, pr_g pg
where eavg.∆Ú±’√—øπªÍ>=pg.mini_tot_b and eavg.∆Ú±’√—øπªÍ<=pg.maxi_tot_b
order by 1)
select m.*, c.∆Ú±’√—∫ÒøÎ, floor((∆Ú±’√—øπªÍ*∆Ú±’¿Ã¿Õ∑¸)) "∆Ú±’√—ºˆ¿Õ"
from avg_cost c, avg_mon m
where c.ø¨µµ=m.ø¨µµ;