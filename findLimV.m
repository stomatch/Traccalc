function [ index ] = findLimV(lim,s )
%--------------------------------------------------------------------- 
%������� ������ �������� ����������� �������� �� ������� ������� ����
% ������� ���������:
% lim - ������� ����������� ��������
% s - ������� ���������� ����
%---------------------------------------------------------------------
j=size(lim);

    for i=1:j(1)
        if (lim(i,1)<=s) && (s<lim(i,2))
            index=lim(i,:);
        end
    end

end

