%������ ���1
%��������һ����ͨ˾������һ�����������п��ܽӵ���;Ҳ�п��ܽӵ���;��
clc,clear,clf;

ALL = [];

for stT = 0.01:0.01:0.50
    
    TEXT = [];
    
    for r=1:100
        
        timeStart = 8;
        timeEnd = 16;
        
        iFlag = 0;    % -1��������� 0����ӿ��� 1�����Ϳ���
        
        Tst = stT;    % ÿһ��������Ҫ��ʱ�� ��ǰ����x�������Tst*x
        
        earnMoney = 0;    %׬����Ǯ��
        
        iChange = 1;    % 1��ʾ�պ�ͻ��״̬ 0��ʾά��ԭ״̬
        
        timeList = [];
        %����ǰ��ʼ��
        
        for time = timeStart:0.01:timeEnd
            %������ȡ����
            [flightPoint,shortTerm,longTerm,shortGet,longGet] = para(time);
            flightPoint = abs(flightPoint);
            
            if iFlag == -1
                if iChange == 1
                    iChange = 0;
                    waitTime = flightPoint * 20;
                    waitFlag = 100*waitTime;
                else
                    if waitFlag < 0
                        iChange = 1;
                        iFlag = 0;
                    else
                        waitFlag = waitFlag - 1;
                        timeList = [timeList,iFlag];
                        %plot(time,iFlag,'.r');
                        %hold on;
                        continue;
                    end
                end
            elseif iFlag == 0
                if iChange == 1
                    iChange = 0;
                    waitTime = ceil(rand*100)*Tst;
                    waitFlag = 100*waitTime;
                else
                    if waitFlag < 0
                        iChange = 1;
                        iFlag = 1;
                    else
                        waitFlag = waitFlag - 1;
                        timeList = [timeList,iFlag];
                        %plot(time,iFlag,'.b');
                        %hold on;
                        continue;
                    end
                end
            else
                if iChange == 1
                    iChange = 0;
                    if rand > 0.5
                        waitTime = longTerm;
                        waitFlag = 100*waitTime;
                        earnMoney = earnMoney + longGet;
                    else
                        waitTime = shortTerm;
                        waitFlag = 100*waitTime;
                        earnMoney = earnMoney + shortGet;
                    end
                else
                    if waitFlag < 0
                        iChange = 1;
                        iFlag = -1;
                    else
                        waitFlag = waitFlag - 1;
                        timeList = [timeList,iFlag];
                        %plot(time,iFlag,'.g');
                        %hold on;
                        continue;
                    end
                end
            end
        end
        
        time_1 = 0;
        time0 = 0;
        time1 = 0;
        for i = 1:size(timeList,2)
            if timeList(i)==-1
                time_1 = time_1 + 1;
            elseif timeList(i)==0
                time0 = time0 +1;
            else
                time1 = time1 + 1;
            end
        end
        
        r
        TEXT = [TEXT;earnMoney];

    end
    
    ALL = [ALL,TEXT];

end

stdPoint = [];
for i=1:50
    stdPoint = [stdPoint,std(ALL(:,i))];
end

i=0.01:0.01:0.50
%plot(i,stdPoint);

p = polyfit(i,stdPoint,3);

x1 =0.01:0.01:0.50;% linspace(0.01:0.01:0.50);
y1 = polyval(p,x1);
plot(i,stdPoint,'.')
hold on
plot(x1,y1)
title('˾�������׼����˿��ϳ�����ʱ��Ĺ�ϵͼ');
xlabel('�˿��ϳ�����ʱ�䣨h��');
ylabel('˾�������׼�Ԫ��');

hold off