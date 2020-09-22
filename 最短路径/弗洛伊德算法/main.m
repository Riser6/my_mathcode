clc;clear;
load data.mat; %��������
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
trip=input('�������������·���������յ㣬[start,destination]=');
start=trip(1);destination=trip(2);
disp(['���',num2str(start),'���յ��·��Ϊ��'])
posi=start;
shortest_path=[posi];
while posi~=destination
    posi=path(posi,destination);
    shortest_path=[shortest_path,posi];
end
disp(shortest_path);
disp(['���·������·����',num2str(dist(start,destination))]);