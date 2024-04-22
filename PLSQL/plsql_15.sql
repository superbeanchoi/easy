-- ������� �Է� ��, ��Ż ��ǰ �� �η� �׸��� ���������� ����ϴ� ���ν���
create or replace procedure p_avgpay(
v_paydate in varchar2,
v_avgpay out varchar2)
is
v_ri ri_pay.ri_tot_pay%type;
v_l l_pay.l_tot_pay%type;
begin
select sum(ri_tot_pay) into v_ri
from ri_pay 
where to_char(ri_pay_date, 'yyyy/mm')=v_paydate and ri_pay_ck='Y'
group by to_char(ri_pay_date, 'yyyy/mm');
select sum(l_tot_pay) into v_l
from l_pay 
where to_char(l_pay_date, 'yyyy/mm')=v_paydate and l_pay_ck='Y'
group by to_char(l_pay_date, 'yyyy/mm');
v_avgpay:=v_paydate||' ���� ��Ż��ǰ �� ����ݾ��� '||v_ri||' �� �̸�, �η��׸� �� ����ݾ��� '||v_l||' �� �Դϴ�.';
end;
/