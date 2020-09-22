% TSP�����ģ���˻��㷨���
clear;clc
Alphy=0.99;T0=100;Tf=3;Markov_length=5200;%�ɵ��ڵĲ��������飩
T=T0;
load coordinates;%�������ݼ�

%����������������
n=size(coordinates,1);
dist=zeros(n,n);
coor_x_i=repmat(coordinates(:,1),1,n);
coor_x_j=coor_x_i';
coor_y_i=repmat(coordinates(:,2),1,n);
coor_y_j=coor_y_i';
dist=sqrt((coor_x_i-coor_x_j).^2+(coor_y_i-coor_y_j).^2);

%��ʼģ���˻�
solve_new=1:n;  solve_current=solve_new;   solve_best=solve_new;
E_new=inf;  E_current=E_new;   E_best=E_new;

while T>Tf
    for i=1:Markov_length  %ͬһ�¶����ظ�Markov_length ���Ŷ�
        %�������ʹ�����ֱ任�����½�
        if rand<0.5
            u=0;    v=0;
            while u==v
                u=randi([1,n]);
                v=randi([1,n]);
            end
            temp=solve_new(u);
            solve_new(u)=solve_new(v);
            solve_new(v)=temp;
        else
            u=0;    v=0;    w=0;
            while (u==v)||(u==w)||(v==w)
                 u=randi([1,n]);
                 v=randi([1,n]);
                 w=randi([1,n]);
            end
            Sort=sort([u,v,w]);
            u=Sort(1);  v=Sort(2);  w=Sort(3);
            temp=solve_new(u:v);
            solve_new(u:(u+w-v-1))=solve_new(v+1:w);
            solve_new(u+w-v:w)=temp;
        end
        E_new=0;
        for i=1:n-1
            E_new=E_new+dist(solve_new(i),solve_new(i+1));
        end
        E_new=E_new+dist(solve_new(n),solve_new(1));
        
        if E_new<E_current
            E_current=E_new;
            solve_current=solve_new;
            if E_new<E_best
                 E_best=E_new;
                 solve_best=solve_new;
            end
        else
            if rand<exp(-(E_new-E_current)/T)
                 E_current=E_new;
                 solve_current=solve_new;
            else
                solve_new=solve_current;
            end
        end
    end
    T=T*Alphy;
end
disp('���Ž��ǣ�')
disp(solve_best)
disp('���·���ǣ�')
disp(E_best)
            