function[posi_data]=make_Positive(data,type)
    if type==1
        posi_data=Min2Max(data);
    elseif type==2
        best=input('请输入最理想的值，best=')
        posi_data=Best2Max(data,best);
    elseif type==3
        a=input('请输入区间的下限，a=')
        b=input('请输入区间的上限，b=')
        posi_data=Inter2Max(data,a,b);
    else
        disp('没有这种类型的指标')
    end
end