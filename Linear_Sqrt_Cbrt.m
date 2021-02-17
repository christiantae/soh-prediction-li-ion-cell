function [rmse,RUL_error] = Linear_Sqrt_Cbrt(cyc,usedcap,num_cycles,i)
%Uses least squares to get parameters for linear model fitting. 
%   Detailed explanation goes here
A = [ones(num_cycles,1) cyc(1:num_cycles) sqrt(cyc(1:num_cycles)) nthroot(cyc(1:num_cycles),3)];
y = usedcap(1:num_cycles); 
parameters = pinv(A)*y; 
prediction = [ones(length(cyc(num_cycles+1:end)),1),cyc(num_cycles+1:end),...
    sqrt(cyc(num_cycles+1:end)) nthroot(cyc(num_cycles+1:end),3)]*parameters;
rmse = sqrt((prediction-usedcap(num_cycles+1:end))'*(prediction-usedcap(num_cycles+1:end))/length(cyc(num_cycles+1:end)));
[usedcap,index]=unique(usedcap);
RUL_actual = interp1(usedcap,cyc(index),0.2);
RUL_pred = interp1(prediction,cyc(num_cycles+1:end),0.2);
RUL_error = abs(RUL_actual-RUL_pred)/RUL_actual*100;
plot(cyc(num_cycles+1:end), prediction,':','linewidth',1)
scatter(RUL_pred,0.2,'filled')
scatter(RUL_actual,0.2,'filled')
title({'Linear + Sqrt + Cbrt Model';['Cell ',num2str(i),', Prediction RMSE: ',num2str(rmse),', RUL Error: ',num2str(RUL_error),'%']})
legend('Training Data','Actual','Predicted','Predicted RUL','Actual RUL','Location','west')
end


