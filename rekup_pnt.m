function [ s ] = rekup_pnt( tx, pr, w, vn, vk, sn, tn, sk )
%REKUP_PNT ������� ������� ���������� �������� ������ � ������ �����������
%(�������������� ����������) ��� ������ ������������ �����
% ������� ���������: 
% - tx - �������� ��������� ��������������
% - pr - ������� ������� ����
% - w  - �������� �������� ������������� �������� ������
% - vn - ��������� �������� ������ ����  
% - sn - ��������� ���������� ������ ����
% - tn - ��������� ����� ������ ����
% - sk - �������� ����� ��������
%
global mp
global ml
global ksi

%% ���������� ������������ �������������� ���� ���� �� �������
% ��� ��� ��������� ���� �������� ��������� ��������� ������, �� ����
% �������������� �������������
cfr(1,1)=-tx(1,4)-w(1,1)-pr(1,3);
cfr(1,2)=-tx(1,5)-w(1,2);
cfr(1,3)=-tx(1,6)-w(1,3);




end

