function plotRes( res )
%������� ������������ ������ ����������� �������� �������
%   Detailed explanation goes here
subplot(2,2,1);
plot(res(:,2),res(:,1));
title('����������� v(S)');
xlabel('S, ��');
ylabel('v, ��/�');
%max_y=max(res(:,4))+10;
%ylim([0 max_y]);
%xlim([0 10]);
set(gca,'GridLineStyle','-');
grid on;

subplot(2,2,3);
plot(res(:,2),res(:,3)*60);
title('����������� t(S)');
xlabel('S, ��');
ylabel('t, ���');
set(gca,'GridLineStyle','-');
grid on;

subplot(2,2,2);
plot(res(:,2),res(:,8));
hold on;
p=plot(res(:,2),res(:,9));
set(p,'Color','red');

subplot(2,2,4);
plot(res(:,2),res(:,10));

end

