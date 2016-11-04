function [ result ] = f_res_trotle( f,vn,vk )
%F_RES_TROTLE ������ �������������� ���� ���� � ����������� �� ��������
% ������� ���������:
% f - ������� �������� ������������� ���� ����
% vn,vk �������� ��������� ��������

dv=(vk-vn)/10;
c=1;
for i=vn:dv:vk
    result(c,1)=i;
    result(c,2)=f(1,1)+f(1,2)*i+f(1,3)*i^2;
    c=c+1;
end
end

