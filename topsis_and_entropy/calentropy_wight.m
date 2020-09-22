function[wight]=calentropy_wight(Data)
% 判断矩阵中是否有负数，有则需要重新标准化
if sum(Data<0)>0
    disp('原标准正向化矩阵中含有负数，需要重新标准化')
    Data=(Data-min(Data))./(max(Data)-min(Data));
    disp('重新正向化的矩阵如下：')
    disp(Data)
end

% 计算各指标对应的概率，此处将评分视作概率，不太科学，应对具体问题可以构造一个特殊分布矩阵
p=Data./sum(Data);

%计算每个指标的信息熵，并计算信息效用值，并归一化得到各个指标的熵权
e=-1/log(size(Data,1))*sum(p.*myln(p));
d=1-e;
wight=d/sum(d);
end