function [posi_data] = Inter2Max(data,a,b)
    len = length(data);
    M = max([a-min(data),max(data)-b]);
    posi_data = zeros(len,1);
    for i = 1: len
        if data(i) < a
           posi_data(i) = 1-(a-data(i))/M;
        elseif data(i) > b
           posi_data(i) = 1-(data(i)-b)/M;
        else
           posi_data(i) = 1;
        end
    end
end