clear all
close all 

load('RUL-OxfordData.mat')

cells = fieldnames(Capacity);
num_cycles = 30;
for i = 1:numel(c)
    cap = Capacity.(cells{i});
    cyc = Cycles.(cells{i}); 
    normcap = cap/cap(1); 
    usedcap = 1-normcap; 
    figure
    plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
end