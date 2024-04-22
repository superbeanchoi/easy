-- 현재 보류 상태인 행사에 대해 총예산이 ‘8천만 원’ 이하인 행사는 진행 취소로 변경하는 커서
accept budget prompt '총예산을 입력하세요 : '

declare
v_budget e_info.e_tot_budget%type;
v_gc_code_ing go_ck.go_ck_code%type;
v_gc_code_end go_ck.go_ck_code%type;
cursor gckcur is
select go_ck_code, e_tot_budget from e_info where go_ck_code=v_gc_code_ing;
begin
v_budget:=&budget;
select go_ck_code into v_gc_code_ing from go_ck where go_ckck='보류';
select go_ck_code into v_gc_code_end from go_ck where go_ckck='진행취소';
for s in gckcur loop
update e_info set go_ck_code=v_gc_code_end where e_tot_budget<=v_budget;
end loop;
end;
/