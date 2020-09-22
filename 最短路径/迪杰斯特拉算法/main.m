clc;clear;
load data.mat; %导入数据
n=size(distance_data,1);
Visit=zeros(1,n);   %记录是否找到最短路径，1为找到最短路径，0为没有找到最短路径
Distance=zeros(1,n);    %记录从初始结点1到每个结点的最短距离
Parent=zeros(1,n);  %沿着最短路径的上一个结点

for i=1:n
    Distance(i)=inf;
    Parent(i)=-1;
end

%默认第一个结点为初始结点
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
destination =input('请输入你想要到达的目的地，destination =');
shortest_path=[];
node=destination;
while node~=0
    shortest_path=[node,shortest_path];
    node=Parent(node);
end
disp('最短路径为')
disp(shortest_path)
disp(['最短距离是',num2str(Distance(destination))])
            