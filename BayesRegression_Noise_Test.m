clear all
close all 

load('RUL-OxfordData.mat')

cells = fieldnames(Capacity);
num_cycles = 30;
i=1;
SqrtResults = []; 

optimal_snr = [21.3000000000000,22.2000000000000,28.9000000000000,21,22,20.6000000000000,24.2000000000000,20.1000000000000];

for i =1:length(optimal_snr)
    cap = Capacity.(cells{i});
    cyc = Cycles.(cells{i}); 
    normcap = cap/cap(1); 
    usedcap = 1-normcap; 
    [rmse,RUL_error,upper,lower] = Linear_Sqrt_Bayes_SNR_plot(cyc,usedcap,num_cycles,i,optimal_snr(i)); 
    SqrtResults(i,1) = rmse;
    SqrtResults(i,2) = RUL_error;  
    SqrtResults(i,3) = upper; 
    SqrtResults(i,4) = lower;
end