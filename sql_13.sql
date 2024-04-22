-- 가장 최근에 진행 종료된 IT 분야 행사에서 투입된 렌탈 물품 항목 정보 조회
select ee.ef_class_name "분야", ee.ed_class_name "상세분류", ee.e_name "행사명", 
cm.cm_name "렌탈거래처", ri.ri_index "물품항목", rd.ri_qt "투입수량"
from (select * from (
select ef.ef_class_name, ed.ed_class_name, ei.e_code, e_name, e_s_date, e_e_date
from e_info ei, ed_class ed, ef_class ef, go_ck gc
where ef.ef_class_code=ed.ef_class_code
and ed.ed_class_code=ei.ed_class_code
and gc.go_ck_code=ei.go_ck_code
and ef.ef_class_name='IT'
and gc.go_ckck='종료'
order by 4 desc)
where rownum=1) ee, ct_info ci, rs_d rd, ri_info ri, cm cm
where ee.e_code=ci.e_code
and ci.ct_code=rd.ct_code
and ri.ri_code=rd.ri_code
and cm.cm_code=ri.cm_code
order by 4 asc, 6 desc;