function[wight]=calentropy_wight(Data)
% �жϾ������Ƿ��и�����������Ҫ���±�׼��
if sum(Data<0)>0
    disp('ԭ��׼���򻯾����к��и�������Ҫ���±�׼��')
    Data=(Data-min(Data))./(max(Data)-min(Data));
    disp('�������򻯵ľ������£�')
    disp(Data)
end

% �����ָ���Ӧ�ĸ��ʣ��˴��������������ʣ���̫��ѧ��Ӧ�Ծ���������Թ���һ������ֲ�����
p=Data./sum(Data);

%����ÿ��ָ�����Ϣ�أ���������ϢЧ��ֵ������һ���õ�����ָ�����Ȩ
e=-1/log(size(Data,1))*sum(p.*myln(p));
d=1-e;
wight=d/sum(d);
end