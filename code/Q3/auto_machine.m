%ֱ�н����о�����
%function []=in_yuanbao(p,long)
%p ����ʻ��ĸ���
%long ��·���� m
%nִ�еĲ��� Ϊ1000��
p=20;
long=125;
n=1000;
L=zeros(1,long/5+1);
V=zeros(1,long/5+1);
flag=0;%flag �����ж��Ƿ��г��ڵȴ��������뿪������
a=0;
figure();
H=imshow(L,[]);
set(gcf,'position',[241 132 560 420]) ;%241 132 560 420(�趨plot���ͼƬ�ĳߴ�)
set(gcf,'doublebuffer','on'); %�趨Ϊ˫����ģʽ
title('Ԫ���Զ�����ͨģ��','color','b');
for i=1:n
    flag=L(1,long/5+1);
    if   p>=rand(1)*100
        L(1,1)=1;
    end
    %�ٶ��趨
    V(1,L(1,1:end-2)==1&L(1,2:end-1)==0&L(1,3:end)==0)=2;
    V(1,L(1,1:end-2)==1&L(1,2:end-1)==0&L(1,3:end)==1)=1;
    V(1,L(1,1:end-2)==1&L(1,2:end-1)==1)=0;
    if flag==1
        a=a+1;
        flag=0;
        L(1,long/5+1)=0;
        V(1,long/5)=0;
    elseif  L(1,long/5)==1;
        V(1,long/5)=1;
    end
    L([zeros(1,1) V(1,1:end-1)]==1)=1;
    L([zeros(1,2) V(1,1:end-2)]==2)=1;
    L(V(1,1:end)==2|V(1,1:end)==1)=0;
    %L(1,(V(1,1:end)==2)+2)=1;
    %L(1,(V(1,1:end)==2)+1)=0;
    %L(1,V(1,1:end)==1+1)=1;
    V=zeros(1,long/5+1);
    
    
    set(H,'CData',L);
    pause(0.1)
end
%end
