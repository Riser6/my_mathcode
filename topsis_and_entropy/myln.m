function [lnp] =  myln(p)
[r,c]=size(p);
lnp=zeros(r,c);
for i=1:r
    for j=1:c
        if p(i,j)==0
            lnp(i,j)=0;
        else
            lnp(i,j)=log(p(i,j));
        end
    end
end
end