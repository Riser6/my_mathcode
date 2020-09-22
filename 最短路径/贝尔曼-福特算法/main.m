clc;clear;
load data.mat; %导入数据
n=size(distance_data,1);
Visit=zeros(1,n);   %记录是否找到最短路径，1为找到最短路径，0为没有找到最短路径
Distance=zeros(1,n);    %记录从初始结点1到每个结点的最短距离
Parent=zeros(1,n);  %沿着最短路径的上一个结点
negloop_exist=0;    %检验是否有负权回路，负权回路：图中存在一个环，环上权重之和为负数

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
            disp('该输入图中存在负权回路，不可使用贝尔曼-福特算法')
            break
        end
    end
    if negloop_exist
        break
    end
end
if ~negloop_exist
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
end
            