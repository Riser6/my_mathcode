clc;clear;
load data.mat; %��������
n=size(distance_data,1);
Visit=zeros(1,n);   %��¼�Ƿ��ҵ����·����1Ϊ�ҵ����·����0Ϊû���ҵ����·��
Distance=zeros(1,n);    %��¼�ӳ�ʼ���1��ÿ��������̾���
Parent=zeros(1,n);  %�������·������һ�����

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
    novisited=find(Visit==0);
    current_min=inf;
    for i=1:length(visited)
        for j=1:length(novisited)
            dist_sum=Distance(visited(i))+distance_data(visited(i),novisited(j));
            if dist_sum<current_min
                current_min=dist_sum;
                parent_node=visited(i);
                new_node=novisited(j);
            end
        end
    end
    Visit(new_node)=1;
    Distance(new_node)=current_min;
    Parent(new_node)=parent_node;
end
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
            