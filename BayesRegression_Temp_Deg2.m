clear all
close all 

load('Oxford_Cap_Data.mat')
load('Oxford_Temp_Data.mat')

num_cycles = 30;
errors = [];
model_type = ["Linear","Squareroot","Quadratic"];
%Cell 1
for i = 1:length(model_type)
    figure
    plot(cyc1(1:num_cycles), usedcap1(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc1(num_cycles+1:end), usedcap1(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc1,usedcap1,num_cycles,1,avg1',model_type(i));
    errors(1,i) = RUL_error; 
end

%Cell 2
for i = 1:length(model_type)
    figure
    plot(cyc2(1:num_cycles), usedcap2(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc2(num_cycles+1:end), usedcap2(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc2,usedcap2,num_cycles,2,avg2',model_type(i));
    errors(2,i) = RUL_error; 
end

%Cell 3
for i = 1:length(model_type)
    figure
    plot(cyc3(1:num_cycles), usedcap3(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc3(num_cycles+1:end), usedcap3(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc3,usedcap3,num_cycles,3,avg3',model_type(i));
    errors(3,i) = RUL_error; 
end

%Cell 4
for i = 1:length(model_type)
    figure
    plot(cyc4(1:num_cycles), usedcap4(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc4(num_cycles+1:end), usedcap4(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc4,usedcap4,num_cycles,4,variance4',model_type(i));
    errors(4,i) = RUL_error; 
end

%Cell 5
for i = 1:length(model_type)
    figure
    plot(cyc5(1:num_cycles), usedcap5(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc5(num_cycles+1:end), usedcap5(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc5,usedcap5,num_cycles,5,avg5',model_type(i));
    errors(5,i) = RUL_error; 
end

%Cell 6
for i = 1:length(model_type)
    figure
    plot(cyc6(1:num_cycles), usedcap6(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc6(num_cycles+1:end), usedcap6(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc6,usedcap6,num_cycles,6,avg6',model_type(i));
    errors(6,i) = RUL_error; 
end

%Cell 7
for i = 1:length(model_type)
    figure
    plot(cyc7(1:num_cycles), usedcap7(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc7(num_cycles+1:end), usedcap7(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc7,usedcap7,num_cycles,7,variance7',model_type(i));
    errors(7,i) = RUL_error; 
end

%Cell 8
for i = 1:length(model_type)
    figure
    plot(cyc8(1:num_cycles), usedcap8(1:num_cycles),'linewidth',3)
    hold on
    plot(cyc8(num_cycles+1:end), usedcap8(num_cycles+1:end),'--','linewidth',1)
    xlabel('Cycle')
    ylabel('Used Capacity')
    [rmse,RUL_error,upper,lower] = Degree2Bayes_TempFeature(cyc8,usedcap8,num_cycles,8,variance8',model_type(i));
    errors(8,i) = RUL_error; 
end



% figure
% plot(cyc7(1:num_cycles), usedcap7(1:num_cycles),'linewidth',3)
% hold on
% plot(cyc7(num_cycles+1:end), usedcap7(num_cycles+1:end),'--','linewidth',1)
% xlabel('Cycle')
% ylabel('Used Capacity')
% [rmse,RUL_error,upper,lower] = Linear_Sqrt_Bayes_TempFeature(cyc7,usedcap7,num_cycles,7,variance7','Quadratic'); 









%SqrtResults = []; 
%     
% for i = 1:numel(cells)
%     cap = Capacity.(cells{i});
%     cyc = Cycles.(cells{i}); 
%     normcap = cap/cap(1); 
%     usedcap = 1-normcap; 
%     figure
%     plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
%     hold on
%     plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
%     [rmse,RUL_error,upper,lower] = Linear_Sqrt_Bayes(cyc,usedcap,num_cycles,i); 
%     SqrtResults(i,1) = rmse;
%     SqrtResults(i,2) = RUL_error;  
%     SqrtResults(i,3) = upper;
%     SqrtResults(i,4) = lower;
% end

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
% Deg2Results = []; 
% for i = 1:numel(cells)
%     cap = Capacity.(cells{i});
%     cyc = Cycles.(cells{i}); 
%     normcap = cap/cap(1); 
%     usedcap = 1-normcap; 
%     figure
%     plot(cyc(1:num_cycles), usedcap(1:num_cycles),'linewidth',3)
%     hold on
%     plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
%     [rmse,RUL_error,upper,lower] = Degree2_Bayes(cyc,usedcap,num_cycles,i); 
%     Deg2Results(i,1) = rmse;
%     Deg2Results(i,2) = RUL_error;  
%     Deg2Results(i,3) = upper;
%     Deg2Results(i,4) = lower;
% end