clc;clear;
load data.mat; %��������
n=size(distance_data,1);
Visit=zeros(1,n);   %��¼�Ƿ��ҵ����·����1Ϊ�ҵ����·����0Ϊû���ҵ����·��
Distance=zeros(1,n);    %��¼�ӳ�ʼ���1��ÿ��������̾���
Parent=zeros(1,n);  %�������·������һ�����
negloop_exist=0;    %�����Ƿ��и�Ȩ��·����Ȩ��·��ͼ�д���һ����������Ȩ��֮��Ϊ����

for i=1:n
    Distance(i)=inf;
    Parent(i)=-1;
end

%Ĭ�ϵ�һ�����Ϊ��ʼ���
Visit(1)=1; 
Distance(1)=0;    
Parent(1)=0;

while sum(Visit)<n
    visited=find(Visit);
    for i=1:length(visited)
        for j=1:n
            dist_sum=Distance(visited(i))+distance_data(visited(i),j);
            if dist_sum<Distance(j)
                Visit(j)=1;
                Distance(j)=dist_sum;
                Parent(j)=visited(i);
            end
        end
    end
end
for i=1:n
    for j=1:n
        dist_sum=Distance(i)+distance_data(i,j);
        if dist_sum<Distance(j)
            negloop_exist=1;
            disp('������ͼ�д��ڸ�Ȩ��·������ʹ�ñ�����-�����㷨')
            break
        end
    end
    if negloop_exist
        break
    end
end
if ~negloop_exist
    destination =input('����������Ҫ�����Ŀ�ĵأ�destination =');
    shortest_path=[];
    node=destination;
    while node~=0
        shortest_path=[node,shortest_path];
        node=Parent(node);
    end
    disp('���·��Ϊ')
    disp(shortest_path)
    disp(['��̾�����',num2str(Distance(destination))])
end
            