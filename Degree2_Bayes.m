function [rmse,RUL_error,RUL_upper,RUL_lower] = Degree2_Bayes(cyc,usedcap,num_cycles,i)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
A = [ones(num_cycles,1) cyc(1:num_cycles) (cyc(1:num_cycles)).^2]; %Building out the matrix of data points 
y = usedcap(1:num_cycles); %Actual outputs, training outputs
parameters = pinv(A)*y; 

cyc2 = cyc; 
fin = cyc(end); 
e = length(cyc); 
for j = 1:3
    cyc2(e+j) = fin+1000*j;
end

% prediction = [ones(length(cyc(num_cycles+1:end)),1),cyc(num_cycles+1:end),...
    %(cyc(num_cycles+1:end)).^2]*parameters;

training_pred = A*parameters; %Find training predictions
training_error = y-training_pred;
var_error = var(training_error); %Find variance on training error

%Setting up bayesian posterior 
lambda = 1; %Play with this parameter 
LAMBDA = lambda*eye(length(A'*A));
mu = inv(A'*A + var_error*LAMBDA)*A'*y;
sigma = var_error*inv(A'*A + var_error*LAMBDA);

prediction2 = [ones(length(cyc2(num_cycles+1:end)),1),cyc2(num_cycles+1:end),...
    (cyc2(num_cycles+1:end)).^2]*mu;

prediction_input = [ones(length(cyc(num_cycles+1:end)),1),cyc(num_cycles+1:end)...
    ,(cyc(num_cycles+1:end)).^2];
for j = 1:size(prediction_input,1)
    var_prediction(j,1) = var_error + prediction_input(j,:)*sigma*prediction_input(j,:)';
end

z = 1.96; %Setting up z-score confidence interval, for 95%
prediction_bayes = [ones(length(cyc(num_cycles+1:end)),1),cyc(num_cycles+1:end),(cyc(num_cycles+1:end)).^2]*mu;
SD_prediction = sqrt(var_prediction);
upper_prediction = prediction_bayes + z*SD_prediction; 
lower_prediction = prediction_bayes - z*SD_prediction;

rmse = sqrt((prediction_bayes-usedcap(num_cycles+1:end))'*(prediction_bayes-usedcap(num_cycles+1:end))/length(cyc(num_cycles+1:end)));
[usedcap,index]=unique(usedcap);
RUL_actual = interp1(usedcap,cyc(index),0.2);
RUL_pred = interp1(prediction2,cyc2(num_cycles+1:end),0.2);
RUL_upper = interp1(lower_prediction,cyc(num_cycles+1:end),0.2);
RUL_lower = interp1(upper_prediction,cyc(num_cycles+1:end),0.2);
RUL_error = abs(RUL_actual-RUL_pred)/RUL_actual*100;
plot(cyc(num_cycles+1:end), prediction_bayes,'linewidth',1)
plot(cyc(num_cycles+1:end), upper_prediction,'color','#EDB120','LineStyle','--')
plot(cyc(num_cycles+1:end), lower_prediction,'color','#EDB120','LineStyle','-.')
scatter(RUL_pred,0.2,'filled')
scatter(RUL_actual,0.2,'filled')
title({['Bayesian 2nd Degree Poly Model'];['Cell ',num2str(i),', Prediction RMSE: ',num2str(rmse),...
    ', RUL Error: ',num2str(RUL_error),'%'];['95% Confidence RUL Range: [',num2str(round(RUL_lower,2)),...
    ',',num2str(round(RUL_upper,2)),']']});
legend('Training Data','Actual','Bayesian Prediction','Upper Bound','Lower Bound','Predicted RUL','Actual RUL','Location','west')
end

