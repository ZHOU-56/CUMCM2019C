%% Initialize
clear, clc

%% Variable Defination
ArrivalRate = 0;    % ��λʱ���ڽ����Ŷ�ϵͳ������(lambda)
ServicePortRate = 0;    % ��λʱ�䵥�����⳵�Ӳ�ƽ̨��λʱ��ķ��������(mu)
ServicePortLineNum = 0; % �����Ӳ�ƽ̨������(C)
ServiceLine = 0;    % �Ӳ���·������

%% Data Process
% �Ӳ�ϵͳ�ķ�æ��(rou)
Busy = ArriveRate / (ServicePortRate * ServicePortLineNum * ServiceLine);
%
P_0_C = 0;
for i = 1: ServicePortLineNum
    P_0_C = P_0_C + (factorial(i)) ^ (-1) * (ArrivalRate / ServicePortRate) ^ (i)...
        + (factorial(ServicePortLineNum)) ^ (-1) * ((1 - Busy)) ^ (-1) * (ArrivalRate...
        / ServicePortRate) ^ (ServicePortLineNum);
end
%
P_C = zeros(1, ServicePortNum);
p_C(i) = ;