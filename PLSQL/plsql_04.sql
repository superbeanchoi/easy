-- ������� ���̺��� �ѿ��� ���� ������ �� ������, ���� �õ� �� ���� �޽����� ��ȯ�ϴ� Ʈ����
create or replace trigger t_ei_etb
after update of e_tot_budget on e_info
for each row
begin
raise_application_error(-20010, '�ѿ����� ������ �� �����ϴ�.');
end;
/