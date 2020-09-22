clear;clc
input_right=0;
RI=[0 0.00001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
% while循环规范输入
while ~input_right
    disp('请输入判断矩阵***判断矩阵必须是一个不大于15*15，具有一定一致性的double型方阵')
    A=input('A=')
    if ~isa(A, 'double')
        disp('输入不是double型数据，请重新输入')
        continue
    end
    [r,c]=size(A)
    if r~=c
        disp('输入的不是一个方阵，请重新输入')
        continue
    else
        n=r;
        if n>=15
            disp('输入方阵不小于15*15，请重新输入')
            continue
        else
            if sum(A.*A'~=1)>0
                disp('输入方阵不是正负反矩阵，请重新输入')
                continue
            else
                [V,D]=eig(A);
                MAX_lamada=max(max(D));
                CI=(MAX_lamada-n)/(n-1);
                CR=CI/RI(n)
                if CR>=0.1
                    disp(['CR=',num2str(CR),',不小于0.1，未能通过一致性检测，请重新输入'])
                else
                    disp(['CR=',num2str(CR),',通过一致性检测'])
                    input_right=1
                end
            end
        end
    end
end

% 使用算术平均法计算权重
SUM_A=sum(A);
SUM_A=repmat(SUM_A,n,1);
new_A=A./SUM_A;
arithmetic_wight=sum(new_A,2)/n;

% 使用几何平均法计算权重
PRODUCT_A=(prod(A,2)).^(1/n)
geometry_wight=PRODUCT_A/sum(PRODUCT_A);

%使用特征值法求权重
[n1,n1]=find(D==MAX_lamada,1);
eig_wight=V(:,n1)/sum(V(:,n1));

disp('使用算术平均法计算的权重是')
disp(arithmetic_wight)
disp('使用几何平均法计算的权重是')
disp(geometry_wight)
disp('使用特征值法计算的权重是')
disp(eig_wight)