clear;clc
load hair_dryer_data.mat
[n,m]=size(Data);
disp(['һ����',num2str(n),'������'])
disp(['һ����',num2str(m),'������ָ��'])
flag_1=input('����ָ���Ƿ���Ҫ���򻯴�����Ҫ������1:');

%������ָ��������򻯣�ת��Ϊ������ָ��
if flag_1==1
    position=input('��������Ҫ����ָ�����ţ����2,3,4��ָ����Ҫ��������[2,3,4]��')
    type=input('��������Ҫ����ָ���ԭָ������(1����С�ͣ�2���м��ͣ�3��������),���������2,3,4�ж�ӦΪ�����ͣ��м��ͣ���С�ͣ�����[3,2,1]��')
    for i=1:length(position)
        disp(['��',num2str(position(i)),'��ָ����������'])
        Data(:,position(i))=make_Positive(Data(:,position(i)),type(i));
        disp(['��',num2str(position(i)),'��ָ���������'])
        disp('*********************************************')
    end
    disp('����ָ���������')
end
disp('���򻯺�ľ������£�')
disp(Data)

%���򻯾����׼��
disp('���ڽ��о����׼��')
root_sq_sum=sum((Data.*Data)).^(0.5);
Data=Data./root_sq_sum;
disp('���򻯾����׼����ɣ�����')
disp(Data)

%����Ȩ��
flag_2=input('�Ƿ���Ҫ��Ȩ�ؼ��㣬��Ҫ������1��');
if flag_2==1
    flag_3=input('�Ƿ�ʹ����Ȩ������Ȩ�أ����������Լ�����Ȩ����������Ҫ������1��');
    if flag_3==1
        wight=calentropy_wight(Data);
    else
        wight=input('������Ȩ���������磺����3��ָ�꣬����Ȩ�طֱ�Ϊ0.5,0.1,0.4������Ҫ����[0.5,0.1,0.4]����');
        wight=wight/sum(wight);
    end
        
else
    wight=ones(1,m)./m
end

%���ӽ���뷨����÷�
Z_P=max(Data);
Z_N=min(Data);
D_P=sum(((Data-Z_P).^(2)).*wight,2);
D_N=sum(((Data-Z_N).^(2)).*wight,2);
Score=D_N./(D_P+D_N);
disp('���ĵ÷�Ϊ��')
stand_Score = Score/ sum(Score)
[sorted_Score,index] = sort(stand_Score ,'descend');