function [iflag] = Exitcar(A,B)
%������󳵲��������A��ǰ��5m���Ƿ��г� �г�����1
iflag = 0;
for i=1:size(B,1)
    if B(i,2) == 1
        continue;
    else
        if B(i,1) - A(1) >0 && B(i,1) - A(1) <5
            iflag = 1;
        end
    end
end
end

