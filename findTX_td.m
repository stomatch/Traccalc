function [ index ] = findTX_td( tx, v )
%������� ������ ������� �������������� � ������� �������� ������� ��������
% tx - ������� ������� �������������
% v - �������� ��� ������� ���������� ���������� ������� ��������������
% ���������� ������-������ ��������������� ����������� ������� ��������������
% index={����� ������� ��������������, ��������� �������� �� ������
% ��������������, �������� �������� �� ������ ��������������, �����������
% �, ����������� B, ����������� �}

j=size(tx);

    for i=2:j(1)
        if (tx(i,2)<=v) && (v<tx(i,3))
            index=tx(i-1,:);
        end
    end

end

