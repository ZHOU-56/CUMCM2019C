%�����ʷ���
clc,clear,clf;
timeStart = 8;
timeEnd = 16;

iFlag = 0;    % -1��������� 0����ӿ��� 1�����Ϳ���

Tst = 0.01;    % ÿһ��������Ҫ��ʱ�� ��ǰ����x�������Tst*x 

earnMoney = 0;    %׬����Ǯ��

shortTerm = 0.3;
longTerm = 0.6;

shortGet = 5;
longGet = 10;

flightPoint = ceil((1/23)*100)/100;    %ÿ0.5h��һ�˷ɻ�
passinger = 100;    %ÿ�˷ɻ�����100���˿� �ָ�25����

nowpast = ceil(rand*100);

iChange = 1;    % 1��ʾ�պ�ͻ��״̬ 0��ʾά��ԭ״̬

timeList = [];

for time = timeStart:0.01:timeEnd
     if iFlag == -1
         if iChange == 1
             iChange = 0;
             waitTime = flightPoint;
             waitFlag = 100*waitTime;
         else
             if waitFlag == 0
                 iChange = 1;
                 iFlag = 0;
             else
                 waitFlag = waitFlag - 1;
                 timeList = [timeList,iFlag];
                 plot(time,iFlag,'.');
                 hold on;
                 continue;
             end
         end 
     elseif iFlag == 0
         if iChange == 1
             iChange = 0;
             waitTime = ceil(rand*100)*Tst;
             waitFlag = 100*waitTime;
         else
             if waitFlag == 0
                 iChange = 1;
                 iFlag = 1;
             else
                 waitFlag = waitFlag - 1;
                 timeList = [timeList,iFlag];
                 plot(time,iFlag,'.');
                 hold on;
                 continue;
             end
         end 
     else
         if iChange == 1
             iChange = 0;
             waitTime = shortTerm;
             waitFlag = 100*waitTime;
             earnMoney = earnMoney + shortGet;
         else
             if waitFlag == 0
                 iChange = 1;
                 iFlag = -1;
             else
                 waitFlag = waitFlag - 1;
                 timeList = [timeList,iFlag];
                 plot(time,iFlag,'.');
                 hold on;
                 continue;
             end
         end  
     end
end