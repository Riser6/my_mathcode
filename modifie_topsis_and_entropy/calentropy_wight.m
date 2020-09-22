function[wight]=calentropy_wight(p_data)
p_data=p_data./sum(p_data,1);
e=-1/log(size(p_data,1))*sum(p_data.*myln(p_data));
d=1-e;
wight=d/sum(d);
end