%Q4����ģ��
clc,clear,clf;
TEXT = [];

for k = 1:100
    
    
    timeStart = 8;
    timeEnd = 16;
    
    iFlag = 0;    % -1��������� 0����ӿ��� 1�����Ϳ���
    
    Tst = 0.003;    % ÿһ��������Ҫ��ʱ�� ��ǰ����x�������Tst*x
    
    earnMoney = 0;    %׬����Ǯ��
    
    %passinger = 100;    %ÿ�˷ɻ�����100���˿� �ָ�25����
    
    iChange = 1;    % 1��ʾ�պ�ͻ��״̬ 0��ʾά��ԭ״̬
    
    timeList = [];
    %����ǰ��ʼ��
    
    
    for time = timeStart:0.001:timeEnd
        %������ȡ����
        [flightPoint,shortTerm,longTerm,shortGet,longGet] = para(time);
        flightPoint = abs(flightPoint);
        
        if iFlag == -1
            if iChange == 1
                iChange = 0;
                waitTime = flightPoint * 20;
                waitFlag = 1000*waitTime;
            else
                if waitFlag < 0
                    iChange = 1;
                    iFlag = 0;
                else
                    waitFlag = waitFlag - 1;
                    timeList = [timeList,iFlag];
%                     plot(time,iFlag,'.r');
%                     hold on;
                    continue;
                end
            end
        elseif iFlag == 0
            if iChange == 1
                iChange = 0;
                waitTime = ceil(rand*100)*Tst;
                waitFlag = 1000*waitTime;
            else
                if waitFlag < 0
                    iChange = 1;
                    iFlag = 1;
                else
                    waitFlag = waitFlag - 1;
                    timeList = [timeList,iFlag];
%                     plot(time,iFlag,'.b');
%                     hold on;
                    continue;
                end
            end
        else
            if iChange == 1
                iChange = 0;
                waitTime = shortTerm;
                waitFlag = 1000*waitTime;
                earnMoney = earnMoney + shortGet;
            else
                if waitFlag < 0
                    iChange = 1;
                    iFlag = -1;
                else
                    waitFlag = waitFlag - 1;
                    timeList = [timeList,iFlag];
%                     plot(time,iFlag,'.g');
%                     hold on;
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
    k
    earnMoney
    % time_1/size(timeList,2)
    % time0/size(timeList,2)
    % time1/size(timeList,2)
    
    TEXT = [TEXT;earnMoney,time_1/size(timeList,2),time0/size(timeList,2),time1/size(timeList,2)];
    
end



