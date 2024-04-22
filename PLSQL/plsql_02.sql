-- ���ͷ��� ��� �����ο��� Ư�� ��翡 ���� �����ο��� ���Ͽ� ��պ��� �ʰ��� ��� ���ʰ���, �̸��� ��� ���������� ����ϴ� �Լ�
create or replace function f_compare_capacity
(p_ecode in number)
return varchar2
is
v_pcode pr_g.pr_g_code%type;
v_avgcapa e_info.e_capa%type;
v_capa e_info.e_capa%type;
begin
select p.pr_g_code into v_pcode
from e_info e, pr_g p
where e.e_tot_budget>=mini_tot_b
and e.e_tot_budget<=maxi_tot_b
and e.e_code=p_ecode;
select floor(avg(e.e_capa)) into v_avgcapa
from e_info e, pr_g p
where e.e_tot_budget>=mini_tot_b
and e.e_tot_budget<=maxi_tot_b
and p.pr_g_code=v_pcode
group by p.pr_g_code;
select e_capa into v_capa
from e_info 
where e_code=p_ecode;
if v_capa<v_avgcapa then
return '����';
else 
return '�ʰ�';
end if;
end;
/