clc,clear;
TIME = 2;
[L,Fly,car,earn] = DATA(TIME);
result = [];

cha = [];

outcar = 100;

for outcar=1:100    
    tst =0.01;
    if car > outcar
        t = outcar * tst;
    else
        t = 1/Fly + car * tst + (outcar - car)*tst;
    end
    EARN0 = (t*earn - L *0.618)/(L*0.618);
    EARN1 = (MoneyOfTaxi(L) - L *0.618)/(L*0.618);
    EARN = [EARN0,EARN1];
    result = [result;EARN];
    cha = [cha,abs(EARN1-EARN0)];
end

i = 1:100;
plot(i,result(:,1),'b');
hold on;
plot(i,result(:,2),'r');
hold on;
plot(i,cha,'g');
title('利润率与候车数量的关系'); 
legend('x=1时的利润率','x=0时的利润率','二者差的的绝对值') 