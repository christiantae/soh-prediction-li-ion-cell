clear all
close all 

load('RUL-OxfordData.mat')

cells = fieldnames(Capacity);
num_cycles = 30;
i=1;
SqrtResults = []; 
    
for i = 1:numel(cells)
    cap = Capacity.(cells{i});
    cyc = Cycles.(cells{i}); 
    normcap = cap/cap(1); 
    usedcap = 1-normcap; 
    figure
    plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
    [rmse,RUL_error,upper,lower] = Linear_Sqrt_Bayes(cyc,usedcap,num_cycles,i); 
    SqrtResults(i,1) = rmse;
    SqrtResults(i,2) = RUL_error;  
    SqrtResults(i,3) = upper;
    SqrtResults(i,4) = lower;
end

% CbrtResults = []; 
% for i = 1:numel(cells)
%     cap = Capacity.(cells{i});
%     cyc = Cycles.(cells{i}); 
%     normcap = cap/cap(1); 
%     usedcap = 1-normcap; 
%     figure
%     plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
%     hold on
%     plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
%     [rmse,RUL_error] = Linear_Sqrt_Cbrt(cyc,usedcap,num_cycles,i); 
%     CbrtResults(i,1) = rmse;
%     CbrtResults(i,2) = RUL_error;  
% end
% 
Deg2Results = []; 
for i = 1:numel(cells)
    cap = Capacity.(cells{i});
    cyc = Cycles.(cells{i}); 
    normcap = cap/cap(1); 
    usedcap = 1-normcap; 
    figure
    plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
    [rmse,RUL_error,upper,lower] = Degree2_Bayes(cyc,usedcap,num_cycles,i); 
    Deg2Results(i,1) = rmse;
    Deg2Results(i,2) = RUL_error;  
    Deg2Results(i,3) = upper;
    Deg2Results(i,4) = lower;
end