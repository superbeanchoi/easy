-- ���ֱ���� ��簳�� Ƚ���� ���� ��� VIP ���(A���~D���)�� ����ϴ� �Լ�
create or replace function f_vip
(code number)
return varchar2
is
v_event_count number;
begin
select count(*) into v_event_count 
from e_info e, go_ck g
where e.go_ck_code=g.go_ck_code and go_ckck in ('������', '����')
and ro_code=code;
return case when v_event_count>=0 and v_event_count<3 then 'D'
when v_event_count>=3 and v_event_count<5 then 'C'
when v_event_count>=5 and v_event_count<8 then 'B'
else 'A' end;
end;
/