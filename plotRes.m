function plotRes( res )
%Функция графического вывода результатов тягового расчета
%   Detailed explanation goes here
subplot(2,2,1);
plot(res(:,2),res(:,1));
title('Зависимость v(S)');
xlabel('S, км');
ylabel('v, км/ч');
%max_y=max(res(:,4))+10;
%ylim([0 max_y]);
%xlim([0 10]);
set(gca,'GridLineStyle','-');
grid on;

subplot(2,2,3);
plot(res(:,2),res(:,3)*60);
title('Зависимость t(S)');
xlabel('S, км');
ylabel('t, мин');
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

