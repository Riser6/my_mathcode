clear;clc
load hair_dryer_data.mat
[n,m]=size(Data);
p_data=cal_p(Data);      %Calculate the probability of the index distribution in the sample
disp(['There are',num2str(n),'samples'])
disp(['There are',num2str(m),'evaluation indexes'])

disp('Matrix normalization is under way')
root_sq_sum=sum((Data.*Data)).^(0.5);
Data=Data./root_sq_sum;
disp('The normalization of the forward matrix is completed as follows')
disp(Data)

%The improved entropy weight method was used to calculate the weight

arti_weight=input('Please enter your manually specified weight'); %[0.9,0.6]
arti_weight=arti_weight/sum(arti_weight);    %Weight normalization

entropy_weight=calentropy_wight(p_data);
wight=arti_weight.*entropy_weight;
Z_P=max(Data);
Z_N=min(Data);
D_P=sum(((Data-Z_P).^(2)).*wight,2);
D_N=sum(((Data-Z_N).^(2)).*wight,2);
Score=D_N./(D_P+D_N);
disp('The final score is£º')
stand_Score = Score/ sum(Score)
[sorted_Score,index] = sort(stand_Score ,'descend');