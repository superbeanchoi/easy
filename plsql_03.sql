-- ���� ���� ������ ��翡 ���� �ѿ����� ��8õ�� ���� ������ ���� ���� ��ҷ� �����ϴ� Ŀ��
accept budget prompt '�ѿ����� �Է��ϼ��� : '

declare
v_budget e_info.e_tot_budget%type;
v_gc_code_ing go_ck.go_ck_code%type;
v_gc_code_end go_ck.go_ck_code%type;
cursor gckcur is
select go_ck_code, e_tot_budget from e_info where go_ck_code=v_gc_code_ing;
begin
v_budget:=&budget;
select go_ck_code into v_gc_code_ing from go_ck where go_ckck='����';
select go_ck_code into v_gc_code_end from go_ck where go_ckck='�������';
for s in gckcur loop
update e_info set go_ck_code=v_gc_code_end where e_tot_budget<=v_budget;
end loop;
end;
/