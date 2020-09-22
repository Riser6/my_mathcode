function[posi_data]=Best2Max(data,best)
   M=max(abs(data-best));
   posi_data=1-abs(data-best)/M;
end