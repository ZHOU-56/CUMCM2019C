function [money] = MoneyOfTaxi(m)
%���������,ʱ�䣬����۸�
    if m < 3
        money = 14;
    elseif m < 15
        money = 14 + ( m - 3 ) * 2.5;
    else
        money = 14 + ( 15 - 3 ) * 2.5 +( m - 15 ) * 3.6;
    end
end

