clear all
close all 

load('RUL-OxfordData.mat')

cells = fieldnames(Capacity);
num_cycles = 30;
LinearResults = [];
for i = 1:numel(cells)
    cap = Capacity.(cells{i});
    cyc = Cycles.(cells{i}); 
    normcap = cap/cap(1); 
    usedcap = 1-normcap; 
    figure
    plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
    [rmse,RUL_error] = Linear(cyc,usedcap,num_cycles,i); 
    LinearResults(i,1) = rmse;
    LinearResults(i,2) = RUL_error; 
end

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
    [rmse,RUL_error] = Linear_Sqrt(cyc,usedcap,num_cycles,i); 
    SqrtResults(i,1) = rmse;
    SqrtResults(i,2) = RUL_error;  
end

CbrtResults = []; 
for i = 1:numel(cells)
    cap = Capacity.(cells{i});
    cyc = Cycles.(cells{i}); 
    normcap = cap/cap(1); 
    usedcap = 1-normcap; 
    figure
    plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
    [rmse,RUL_error] = Linear_Sqrt_Cbrt(cyc,usedcap,num_cycles,i); 
    CbrtResults(i,1) = rmse;
    CbrtResults(i,2) = RUL_error;  
end

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
    [rmse,RUL_error] = Degree2(cyc,usedcap,num_cycles,i); 
    Deg2Results(i,1) = rmse;
    Deg2Results(i,2) = RUL_error;  
end