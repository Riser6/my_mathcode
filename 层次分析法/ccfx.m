clear;clc
input_right=0;
RI=[0 0.00001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
% whileѭ���淶����
while ~input_right
    disp('�������жϾ���***�жϾ��������һ��������15*15������һ��һ���Ե�double�ͷ���')
    A=input('A=')
    if ~isa(A, 'double')
        disp('���벻��double�����ݣ�����������')
        continue
    end
    [r,c]=size(A)
    if r~=c
        disp('����Ĳ���һ����������������')
        continue
    else
        n=r;
        if n>=15
            disp('���뷽��С��15*15������������')
            continue
        else
            if sum(A.*A'~=1)>0
                disp('���뷽������������������������')
                continue
            else
                [V,D]=eig(A);
                MAX_lamada=max(max(D));
                CI=(MAX_lamada-n)/(n-1);
                CR=CI/RI(n)
                if CR>=0.1
                    disp(['CR=',num2str(CR),',��С��0.1��δ��ͨ��һ���Լ�⣬����������'])
                else
                    disp(['CR=',num2str(CR),',ͨ��һ���Լ��'])
                    input_right=1
                end
            end
        end
    end
end

% ʹ������ƽ��������Ȩ��
SUM_A=sum(A);
SUM_A=repmat(SUM_A,n,1);
new_A=A./SUM_A;
arithmetic_wight=sum(new_A,2)/n;

% ʹ�ü���ƽ��������Ȩ��
PRODUCT_A=(prod(A,2)).^(1/n)
geometry_wight=PRODUCT_A/sum(PRODUCT_A);

%ʹ������ֵ����Ȩ��
[n1,n1]=find(D==MAX_lamada,1);
eig_wight=V(:,n1)/sum(V(:,n1));

disp('ʹ������ƽ���������Ȩ����')
disp(arithmetic_wight)
disp('ʹ�ü���ƽ���������Ȩ����')
disp(geometry_wight)
disp('ʹ������ֵ�������Ȩ����')
disp(eig_wight)