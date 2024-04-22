-- �η� ���� ��û �ο��� ����� ��, �η� ���� ���̺��� �� ���� �ݾ��� �����ϴ� Ʈ����
create or replace trigger t_update_lpay
after update of l_qt on ls_d 
for each row
declare
begin
update l_pay set l_tot_pay=:new.l_qt*(
select ld_avg_cost
from ld_info where ld_code=:old.ld_code)
where ls_d_code=:new.ls_d_code;
end;
/