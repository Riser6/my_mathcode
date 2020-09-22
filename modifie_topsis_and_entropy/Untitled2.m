clear;clc
load hair_dryer_data.mat
[n,m]=size(Data);
disp(['一共有',num2str(n),'个样本'])
disp(['一共有',num2str(m),'个评价指标'])
flag_1=input('请问指标是否需要正向化处理？需要请输入1:');

%对所有指标进行正向化，转化为极大型指标
if flag_1==1
    position=input('请输入需要处理指标的序号，如第2,3,4个指标需要处理，输入[2,3,4]：')
    type=input('请输入需要处理指标的原指标类型(1：极小型，2：中间型，3：区间型),假如上面的2,3,4列对应为区间型，中间型，极小型，输入[3,2,1]：')
    for i=1:length(position)
        disp(['第',num2str(position(i)),'个指标正在正向化'])
        Data(:,position(i))=make_Positive(Data(:,position(i)),type(i));
        disp(['第',num2str(position(i)),'个指标正向化完成'])
        disp('*********************************************')
    end
    disp('所有指标正向化完成')
end
disp('正向化后的矩阵如下：')
disp(Data)

%正向化矩阵标准化
disp('正在进行矩阵标准化')
root_sq_sum=sum((Data.*Data)).^(0.5);
Data=Data./root_sq_sum;
disp('正向化矩阵标准化完成，如下')
disp(Data)

%计算权重
flag_2=input('是否需要带权重计算，需要请输入1：');
if flag_2==1
    flag_3=input('是否使用熵权法计算权重，否则您将自己输入权重向量，需要请输入1：');
    if flag_3==1
        wight=calentropy_wight(Data);
    else
        wight=input('请输入权重向量（如：您有3个指标，它们权重分别为0.5,0.1,0.4，您需要输入[0.5,0.1,0.4]）：');
        wight=wight/sum(wight);
    end
        
else
    wight=ones(1,m)./m
end

%优劣解距离法计算得分
Z_P=max(Data);
Z_N=min(Data);
D_P=sum(((Data-Z_P).^(2)).*wight,2);
D_N=sum(((Data-Z_N).^(2)).*wight,2);
Score=D_N./(D_P+D_N);
disp('最后的得分为：')
stand_Score = Score/ sum(Score)
[sorted_Score,index] = sort(stand_Score ,'descend');