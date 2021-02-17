clear all
close all 

load('RUL-OxfordData.mat')

cells = fieldnames(Capacity);
num_cycles = 30;
i=1;
SqrtResults = []; 

snr = 20:0.1:70;
trial = 1; 
for k = 1:trial; 
    for j = 1:length(snr)
    snr_val = snr(j);
        for i = 1:numel(cells)
            cap = Capacity.(cells{i});
            cyc = Cycles.(cells{i}); 
            normcap = cap/cap(1); 
            usedcap = 1-normcap; 
            [rmse,RUL_error,upper,lower] = Linear_Sqrt_Bayes_SNR(cyc,usedcap,num_cycles,i,snr_val); 
            SqrtResults(i,1,j) = rmse;
            SqrtResults(i,2,j) = RUL_error;  
            SqrtResults(i,3,j) = upper; 
            SqrtResults(i,4,j) = lower;
        end
    end

    for i = 1:numel(cells)
        figure
        scatter(snr,reshape(SqrtResults(i,2,:),[length(snr),1]))
        min_error = min(SqrtResults(i,2,:)); 
        min_error_data(k,i) = min_error;
        min_snr = snr(find(SqrtResults(i,2,:)==min_error));
        min_snr_data(k,i) = min_snr;
        title({['Bayesian Sqrt Model'];['Cell ',num2str(i),', Optimal RUL Error: ',num2str(min_error),...
        '%, Optimal SNR: ',num2str(min_snr)]});
        ylabel('% Error') 
        xlabel('SNR (dB)')
        hold on
        scatter(min_snr,min_error,'filled','r')
    end
end

average_SNR = mean(min_snr);


