clc;clear;
load data.mat; %导入数据
n=size(distance_data,1);
dist=zeros(n,n);
path=zeros(n,n);
dist=distance_data;
for i=1:n
    for j=1:n
        if (dist(i,j)~=0)&&(dist(i,j)~=inf)
            path(i,j)=j;
        else
           path(i,j)=-1;
        end
    end
end

for k=1:n
    for i=1:n
        for j=1:n
            if (dist(i,k)+dist(k,j))<dist(i,j)
                dist(i,j)=dist(i,k)+dist(k,j);
                path(i,j)=k;
            end
        end
    end
end
trip=input('请输入您想计算路径的起点和终点，[start,destination]=');
start=trip(1);destination=trip(2);
disp(['起点',num2str(start),'到终点的路径为：'])
posi=start;
shortest_path=[posi];
while posi~=destination
    posi=path(posi,destination);
    shortest_path=[shortest_path,posi];
end
disp(shortest_path);
disp(['最短路径的总路程是',num2str(dist(start,destination))]);