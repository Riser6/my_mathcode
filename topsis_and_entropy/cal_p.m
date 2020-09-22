function[p_data]=cal_p(Data)
[n,m]=size(Data);
p_data=zeros(n,m);
num=zeros(5,2);

for i=1:n
    if Data(i,2)>0.8
        num(5,2)=num(5,2)+1;
    elseif Data(i,2)>0.6
        num(4,2)=num(4,2)+1;
    elseif Data(i,2)>0.4
        num(3,2)=num(3,2)+1;
    elseif Data(i,2)>0.2
        num(2,2)=num(2,2)+1;
    else
        num(1,2)=num(1,2)+1;
    end
end

for i=1:n
    if Data(i,1)==5
        num(5,1)=num(5,1)+1;
    elseif Data(i,1)==4
        num(4,1)=num(4,1)+1;
    elseif Data(i,1)==3
        num(3,1)=num(3,1)+1;
    elseif Data(i,1)==2
        num(2,1)=num(2,1)+1;
    else
        num(1,1)=num(1,1)+1;
    end
end
p=num./sum(num,1)
for i=1:n
    if Data(i,1)==5
        p_data(i,1)=p(5,1);
    elseif Data(i,1)==4
        p_data(i,1)=p(4,1);
    elseif Data(i,1)==3
        p_data(i,1)=p(3,1);
    elseif Data(i,1)==2
        p_data(i,1)=p(2,1);
    else
        p_data(i,1)=p(1,1);
    end
end
 
for i=1:n
    if Data(i,2)>0.8
        p_data(i,2)=p(5,2);
    elseif Data(i,2)>0.6
        p_data(i,2)=p(4,2);
    elseif Data(i,2)>0.4
        p_data(i,2)=p(3,2);
    elseif Data(i,2)>0.2
        p_data(i,2)=p(2,2);
    else
        p_data(i,2)=p(1,2);
    end
end

