%�������
%��ʼ���������
%�ֱ������<3km��3~15km��>15km
distan3 = 0;
distan315 = 0;
distan15 = 0;
%��ø����ص���������
point = xlsread('./�Ϻ��ص�����.xlsx','Sheet1','P2:Q408824');
%��ʼ����������
airport = [121.808,31.151];
%����뾶
R = 6371;
for i=1:size(point,1)
    %���������پ���
    %ʹ��Haversine���Ƶ���ʽ
    distan_x = abs(2*R * asin( sqrt( sin(0.5*point(i,2)-0.5*airport(2))^2))/100);
    distan_y = abs(2*R * asin( sqrt( cos(point(i,2))^2 * sin(0.5*point(i,1)-0.5*airport(1))^2))/100);
    distan_all = distan_x+distan_y;  
    if distan_all < 3+5
        distan3 = distan3 + 1;
    elseif distan_all <15+5
        distan315 = distan315 +1;
    else distan_all < 30 + 5 
        distan15 = distan15 + 1;
    end
end
%���ÿ��Ŀ�ĵ�����ĸ���
pro3 = distan3/size(point,1);
pro315 = distan315/size(point,1);
pro15 = distan15/size(point,1)