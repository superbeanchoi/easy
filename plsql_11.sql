-- '���ǵ巻Ż' ��Ż��ü�� ��ü ��ǰ �ܰ��� ��� 10% �λ��ϴ� Ŀ��
accept cname prompt '�ŷ�ó���� �Է��ϼ��� : '
accept cup prompt '�λ���� �Է����ּ��� : '

declare
v_cc cm.cm_code%type;
v_up number(10,2);
v_c ri_info.ri_code%type;
v_ric ri_info.ri_cost%type;
v_nric ri_info.ri_cost%type;
cursor cmcur is select ri.ri_code, ri.ri_cost from ri_info ri where ri.cm_code=v_cc;
begin
v_up:=(&cup*0.01)+1;
select cm.cm_code into v_cc from cm cm where cm.cm_name='&cname';
for i in cmcur loop
v_c:=i.ri_code;
v_ric:=i.ri_cost;
v_nric:=v_up*v_ric;
update ri_info set ri_cost=v_nric where ri_code=v_c;
end loop;
dbms_output.put_line('�ŷ�ó�� ��ǰ �ܰ��� ��� �λ�Ǿ����ϴ�.');
end;
/