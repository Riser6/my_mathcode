function[posi_data]=make_Positive(data,type)
    if type==1
        posi_data=Min2Max(data);
    elseif type==2
        best=input('�������������ֵ��best=')
        posi_data=Best2Max(data,best);
    elseif type==3
        a=input('��������������ޣ�a=')
        b=input('��������������ޣ�b=')
        posi_data=Inter2Max(data,a,b);
    else
        disp('û���������͵�ָ��')
    end
end