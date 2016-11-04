%% ����� ���� ��� ������ "������������ �����"
% ������������ ��������� �������� ������ � ������ ����
%% ��������� ������ �������
function [ s ] = throtle_pnt(tx,pr,w,vn,vlim, sn,tn,sk )
%% 
%  tx - �������� ������� ��������������
% pr - ������� ������� ����
% w  - �������� �������� ������������� �������� ������
% vn - ��������� �������� ������ ���� 
% vlim - ����������� �� �������� (������������ �������� �� ������� �����
% �����������)
% sn - ��������� ���������� ������ ����
% tn - ��������� ����� ������ ����
% sk - �������� ����� ��������
%% ���������� ����������
%global traction
global mp 
global ml 
global ksi 
%%
%  traction - _ *�� ����� ��� ��� �����, �� ������ ����* _ 
% mp - ����� ������
% ml - ����� ����������
% ksi- ���������� �����������

%% ������������ �������������� ���� ���� �� �������
% ��� ����������� ���������� �������� ���������� ���������� ��������������
% ����, ����������� �� ����� � ������ ����:
% 
% $\Sigma f=f_t-\omega-i$,
%  
% ��� $f_t$ - �������� ���� ���� �����������,
%     $\omega$ - �������� �������� ������������� �������� ������,
%     $i$ - �������������� ������������� �������� ������ �� ������� ����
cfr(1,1)=tx(1,4)-w(1,1)-pr(1,3);
cfr(1,2)=tx(1,5)-w(1,2);
cfr(1,3)=tx(1,6)-w(1,3);


f=0; % ����, ����� ���������, �� ����� �� ��� �����

%% ��������������� ������� ��� ������ ����
% �� �������� �������� ���������  $[v_n;v_k]$
% ���������� �������� �������������� ���� ��� �������� ������ $v_n$ �
% �������� ������ $v_k$, ���� �������������� ���� ������ ����, �� ��
% �������� ��������� ��������� ���������� �������������� �����, �.�.
% �������� � ���������� ���������. ������� �������� ��������������� ������
% _v_const_

fres_vn=f_res(cfr,vn);      %�������� � ������ ��������� ���������
fres_vk=f_res(cfr,tx(1,3)); %�������� � ����� ��������� ���������

if ((fres_vn>0) && (fres_vk<0)) || ((fres_vn<0) && (fres_vk>0)) % ���� ���� ��������
    v_const=fzero(@(x) f_res(cfr,x),[vn tx(1,3)]); % ������� �������� ��������������� ������
else
    v_const=-1; % ���� ���� ��  �������� �������� ��������������� ������ -1
end

%%
% ���������� �������������� �� ���� � �� �������
sc=SVCurve(cfr,vn);
tc=TVCurve(cfr,vn);

%%
% ���������� �������� �������� $v_k$. �������� � ����� ������� ���
% ���������� ��������� �������� ����, �������� �������� $v_k$ ������
% ����������� �������� $v_{lim}$, ��� ������ $v_{const}$, ��� ��� ��������
% �������� � ����� �������, ����� ��������� �������� ���������� ��������
% ������� ���� $S_{ik}$
%%
% � ������ ��������� ����������� �������� ����������� �������� $v_k$

if v_const<0 %�������� ������� �������� �� vk, vlim, v_const
    v_min(1,1)=tx(1,3);
    v_min(1,2)=vlim;
    vk=min(v_min);
else
    v_min(1,1)=tx(1,3);
    v_min(1,2)=vlim;
    v_min(1,3)=v_const;
    vk=min(v_min);
end
% �������� �������� vk � ������ �������� ���������� ������� ����
Stmp=SVCurve(cfr,vk)-sc;
if sk>=(pr(1,2)+pr(1,4)) % �������� ���������� ������� �� ������� �������� �������?
    if Stmp+sn>pr(1,4)+pr(1,2)
        vk=fzero(@(x) (SVCurve(cfr,x)-sc+sn-pr(1,4)-pr(1,2)), [vn vk]);
        f=1;
    end
else % ���, �� �� �������
    if Stmp+sn>sk
        vk=fzero(@(x) (SVCurve(cfr,x)-sc+sn-sk), [vn vk]);
    end
end

%%
% ��� ���������� ��������� ���������, ���������� �������������� ���������
% �������� ������:
%%
% �������������� ��������
Mv=vk-(integral(@(x) (SVCurve(cfr,x)-sc),vn,vk))/(SVCurve(cfr,vk)-sc);
%���������
Dv=(ksi./(SVCurve(cfr,vk)-sc)).*(integral(@(x) ((x-Mv).^2.*x./(cfr(1,1)+cfr(1,2).*x+cfr(1,3).*x.^2)),vn,vk));
% ������� �� ����������� ������
A=2.725*10^(-3)*(ml+mp)*(cfr(1,1)+cfr(1,2)*Mv+cfr(1,3)*Mv^2+Dv*cfr(1,3))*(SVCurve(cfr,vk)-sc);
dv=(vk-vn)/10;
c=1;
%% ���������� ������� �� ������� ���������
s=zeros(10);
for i=vn:dv:vk
    s(c,1)=i; %�������� ��������
    s(c,2)=SVCurve(cfr,i)-sc+sn; %���������� ����
    s(c,3)=TVCurve(cfr,i)-tc+tn; %����� � ����
    s(c,4)=vlim; %����������� ��������
    s(c,5)=v_const; %�������� ��������������� ������
    s(c,6)=f_res(cfr,i); %�������� �������������� ���� ����������� �� �����
    s(c,7)=pr(1,3); %�������� ������
    s(c,8)=Mv; %�������������� ��������
    s(c,9)=Dv; %��������� ��������
    s(c,10)=A;
    c=c+1;
end
c=c-1;
s(c,1)=vk;
if f==1
    s(c,2)=pr(1,2)+pr(1,4);
else
    s(c,2)=SVCurve(cfr,vk)-sc+sn;
end
s(c,3)=TVCurve(cfr,vk)-tc+tn;
s(c,4)=vlim; %����������� ��������
s(c,5)=v_const; %�������� ��������������� ������
s(c,6)=f_res(cfr,vk); %�������� �������������� ���� ����������� �� �����
s(c,7)=pr(1,3); %�������� ������
end
