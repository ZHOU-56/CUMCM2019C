%% Initialize
clear, clc

%% Variable Defination
ArrivalRate = 0;    % 单位时间内进入排队系统的人数(lambda)
ServicePortRate = 0;    % 单位时间单个出租车接驳平台单位时间的服务的人数(mu)
ServicePortLineNum = 0; % 单条接驳平台的数量(C)
ServiceLine = 0;    % 接驳道路的列数

%% Data Process
% 接驳系统的繁忙率(rou)
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