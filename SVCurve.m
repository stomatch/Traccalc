function [s] = SVCurve( f,v )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global ksi
if (f(2)^2-4*f(1)*f(3))>0
    d=sqrt(f(2)^2-4*f(1)*f(3));
    x1=(-f(2)+d)/(2*f(3));
    x2=(-f(2)-d)/(2*f(3));
    s=ksi/d*(x1*log(abs(v-x1))-x2*log(abs(v-x2)));
else
    d=sqrt(4*f(1)*f(3)-f(2)^2);
    s=ksi/f(3)*(log(abs(f(1)+f(2)*v+f(3)*v.^2))/2-f(2)/d*atan((2*f(3)*v+f(2))/d));
end

end

