function [rmse,RUL_error,RUL_upper,RUL_lower] = Linear_Sqrt_Bayes_SNR(cyc,usedcap,num_cycles,i,SNR)
%Uses least squares to get parameters for linear model fitting. 
%   Detailed explanation goes here
y = awgn(usedcap(1:num_cycles),SNR,'measured');
% figure
% plot(cyc(1:num_cycles), y,'linewidth',3)
% hold on
% plot(cyc(num_cycles+1:end), usedcap(num_cycles+1:end),'--','linewidth',1)
   
A = [ones(num_cycles,1) cyc(1:num_cycles) sqrt(cyc(1:num_cycles))]; %Building out the matrix of data points 
 %Actual outputs, training outputs
parameters = pinv(A)*y; %Find best fit parameters based on noisy data 

training_pred = A*parameters; %Find training predictions
training_error = y-training_pred;
var_error = var(training_error); %Find variance on training error

%Setting up bayesian posterior 
lambda = 1; %Play with this parameter 
LAMBDA = lambda*eye(length(A'*A));
mu = inv(A'*A + var_error*LAMBDA)*A'*y;
sigma = var_error*inv(A'*A + var_error*LAMBDA);

prediction_input = [ones(length(cyc(num_cycles+1:end)),1),cyc(num_cycles+1:end)...
    ,sqrt(cyc(num_cycles+1:end))];
for j = 1:size(prediction_input,1)
    var_prediction(j,1) = var_error + prediction_input(j,:)*sigma*prediction_input(j,:)';
end

z = 1.96; %Setting up z-score confidence interval, for 95%
prediction_bayes = [ones(length(cyc(num_cycles+1:end)),1),cyc(num_cycles+1:end),sqrt(cyc(num_cycles+1:end))]*mu;
SD_prediction = sqrt(var_prediction);
upper_prediction = prediction_bayes + z*SD_prediction; 
lower_prediction = prediction_bayes - z*SD_prediction;

rmse = sqrt((prediction_bayes-usedcap(num_cycles+1:end))'*(prediction_bayes-usedcap(num_cycles+1:end))/length(cyc(num_cycles+1:end)));
[usedcap,index]=unique(usedcap);
RUL_actual = interp1(usedcap,cyc(index),0.2);
RUL_pred = interp1(prediction_bayes,cyc(num_cycles+1:end),0.2);
RUL_upper = interp1(lower_prediction,cyc(num_cycles+1:end),0.2);
RUL_lower = interp1(upper_prediction,cyc(num_cycles+1:end),0.2);
RUL_error = abs(RUL_actual-RUL_pred)/RUL_actual*100;
% plot(cyc(num_cycles+1:end), prediction_bayes,'linewidth',1)
% plot(cyc(num_cycles+1:end), upper_prediction,'color','#EDB120','LineStyle','--')
% plot(cyc(num_cycles+1:end), lower_prediction,'color','#EDB120','LineStyle','-.')
% scatter(RUL_pred,0.2,'filled')
% scatter(RUL_actual,0.2,'filled')
% title({['Bayesian Sqrt Model with Training Noise'];['Cell ',num2str(i),', Prediction RMSE: ',num2str(rmse),...
%     ', RUL Error: ',num2str(RUL_error),'%'];['95% Confidence RUL Range: [',num2str(round(RUL_lower,2)),...
%     ',',num2str(round(RUL_upper,2)),']']});
% legend('Training Data','Actual','Bayesian Prediction','Upper Bound','Lower Bound','Predicted RUL','Actual RUL','Location','west')
end


