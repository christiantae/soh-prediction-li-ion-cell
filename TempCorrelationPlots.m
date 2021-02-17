clear all
close all 

load('RUL-OxfordData.mat')
load('Oxford_temp_Data.mat')

cap1 = Capacity.Cell1;
normcap1 = cap1/cap1(1); 
usedcap1 = 1-normcap1; 
avg1(16) = []; %Remove outlier temperature data 
usedcap1(16) = [];
scatter(avg1,usedcap1)
rho_avg1 = corr(avg1',usedcap1,'Type','Spearman');
r_avg1 = corr(avg1',usedcap1,'Type','Pearson');
hold on
med1(16) = [];
maximum1(16) = [];
minimum1(16) = [];
rho_med1 = corr(med1',usedcap1,'Type','Spearman');
r_med1 = corr(med1',usedcap1,'Type','Pearson');
rho_max1 = corr(maximum1',usedcap1,'Type','Spearman');
r_max1 = corr(maximum1',usedcap1,'Type','Pearson');
rho_min1 = corr(minimum1',usedcap1,'Type','Spearman');
r_min1 = corr(minimum1',usedcap1,'Type','Pearson');
scatter(med1,usedcap1)
scatter(maximum1,usedcap1)
scatter(minimum1,usedcap1)
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg1,3)),', R=',num2str(round(r_avg1,3))],...
    ['Median: ','\rho=',num2str(round(rho_med1,3)),', R=',num2str(round(r_med1,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max1,3)),', R=',num2str(round(r_max1,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min1,3)),', R=',num2str(round(r_min1,3))],...
    'Location','bestoutside')


figure
cap2 = Capacity.Cell2;
normcap2 = cap2/cap2(1); 
usedcap2 = 1-normcap2; 
scatter(avg2,usedcap2)
hold on
scatter(med2,usedcap2)
scatter(maximum2,usedcap2)
scatter(minimum2,usedcap2)
rho_avg2 = corr(avg2',usedcap2,'Type','Spearman');
r_avg2 = corr(avg2',usedcap2,'Type','Pearson');
rho_med2 = corr(med2',usedcap2,'Type','Spearman');
r_med2 = corr(med2',usedcap2,'Type','Pearson');
rho_max2 = corr(maximum2',usedcap2,'Type','Spearman');
r_max2 = corr(maximum2',usedcap2,'Type','Pearson');
rho_min2 = corr(minimum2',usedcap2,'Type','Spearman');
r_min2 = corr(minimum2',usedcap2,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg2,3)),', R=',num2str(round(r_avg2,3))],...
    ['Median: ','\rho=',num2str(round(rho_med2,3)),', R=',num2str(round(r_med2,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max2,3)),', R=',num2str(round(r_max2,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min2,3)),', R=',num2str(round(r_min2,3))],...
    'Location','bestoutside')

figure
cap3 = Capacity.Cell3;
normcap3 = cap3/cap3(1); 
usedcap3 = 1-normcap3; 
scatter(avg3,usedcap3)
hold on
scatter(med3,usedcap3)
scatter(maximum3,usedcap3)
scatter(minimum3,usedcap3)
rho_avg3 = corr(avg3',usedcap3,'Type','Spearman');
r_avg3 = corr(avg3',usedcap3,'Type','Pearson');
rho_med3 = corr(med3',usedcap3,'Type','Spearman');
r_med3 = corr(med3',usedcap3,'Type','Pearson');
rho_max3 = corr(maximum3',usedcap3,'Type','Spearman');
r_max3 = corr(maximum3',usedcap3,'Type','Pearson');
rho_min3 = corr(minimum3',usedcap3,'Type','Spearman');
r_min3 = corr(minimum3',usedcap3,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg3,3)),', R=',num2str(round(r_avg3,3))],...
    ['Median: ','\rho=',num2str(round(rho_med3,3)),', R=',num2str(round(r_med3,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max3,3)),', R=',num2str(round(r_max3,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min3,3)),', R=',num2str(round(r_min3,3))],...
    'Location','bestoutside')

figure
cap4 = Capacity.Cell4;
normcap4 = cap4/cap4(1); 
usedcap4 = 1-normcap4; 
scatter(avg4,usedcap4)
hold on
scatter(med4,usedcap4)
scatter(maximum4,usedcap4)
scatter(minimum4,usedcap4)
rho_avg4 = corr(avg4',usedcap4,'Type','Spearman');
r_avg4 = corr(avg4',usedcap4,'Type','Pearson');
rho_med4 = corr(med4',usedcap4,'Type','Spearman');
r_med4 = corr(med4',usedcap4,'Type','Pearson');
rho_max4 = corr(maximum4',usedcap4,'Type','Spearman');
r_max4 = corr(maximum4',usedcap4,'Type','Pearson');
rho_min4 = corr(minimum4',usedcap4,'Type','Spearman');
r_min4 = corr(minimum4',usedcap4,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg4,3)),', R=',num2str(round(r_avg4,3))],...
    ['Median: ','\rho=',num2str(round(rho_med4,3)),', R=',num2str(round(r_med4,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max4,3)),', R=',num2str(round(r_max4,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min4,3)),', R=',num2str(round(r_min4,3))],...
    'Location','bestoutside')

figure
cap5 = Capacity.Cell5;
normcap5 = cap5/cap5(1); 
usedcap5 = 1-normcap5; 
scatter(avg5,usedcap5)
hold on
scatter(med5,usedcap5)
scatter(maximum5,usedcap5)
scatter(minimum5,usedcap5)
rho_avg5 = corr(avg5',usedcap5,'Type','Spearman');
r_avg5 = corr(avg5',usedcap5,'Type','Pearson');
rho_med5 = corr(med5',usedcap5,'Type','Spearman');
r_med5 = corr(med5',usedcap5,'Type','Pearson');
rho_max5 = corr(maximum5',usedcap5,'Type','Spearman');
r_max5 = corr(maximum5',usedcap5,'Type','Pearson');
rho_min5 = corr(minimum5',usedcap5,'Type','Spearman');
r_min5 = corr(minimum5',usedcap5,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg5,3)),', R=',num2str(round(r_avg5,3))],...
    ['Median: ','\rho=',num2str(round(rho_med5,3)),', R=',num2str(round(r_med5,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max5,3)),', R=',num2str(round(r_max5,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min5,3)),', R=',num2str(round(r_min5,3))],...
    'Location','bestoutside')

figure
cap6 = Capacity.Cell6;
normcap6 = cap6/cap6(1); 
usedcap6 = 1-normcap6; 
scatter(avg6,usedcap6)
hold on
scatter(med6,usedcap6)
scatter(maximum6,usedcap6)
scatter(minimum6,usedcap6)
rho_avg6 = corr(avg6',usedcap6,'Type','Spearman');
r_avg6 = corr(avg6',usedcap6,'Type','Pearson');
rho_med6 = corr(med6',usedcap6,'Type','Spearman');
r_med6 = corr(med6',usedcap6,'Type','Pearson');
rho_max6 = corr(maximum6',usedcap6,'Type','Spearman');
r_max6 = corr(maximum6',usedcap6,'Type','Pearson');
rho_min6 = corr(minimum6',usedcap6,'Type','Spearman');
r_min6 = corr(minimum6',usedcap6,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg6,3)),', R=',num2str(round(r_avg6,3))],...
    ['Median: ','\rho=',num2str(round(rho_med6,3)),', R=',num2str(round(r_med6,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max6,3)),', R=',num2str(round(r_max6,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min6,3)),', R=',num2str(round(r_min6,3))],...
    'Location','bestoutside')

figure
cap7 = Capacity.Cell7;
normcap7 = cap7/cap7(1); 
usedcap7 = 1-normcap7; 
scatter(avg7,usedcap7)
hold on
scatter(med7,usedcap7)
scatter(maximum7,usedcap7)
scatter(minimum7,usedcap7)
rho_avg7 = corr(avg7',usedcap7,'Type','Spearman');
r_avg7 = corr(avg7',usedcap7,'Type','Pearson');
rho_med7 = corr(med7',usedcap7,'Type','Spearman');
r_med7 = corr(med7',usedcap7,'Type','Pearson');
rho_max7 = corr(maximum7',usedcap7,'Type','Spearman');
r_max7 = corr(maximum7',usedcap7,'Type','Pearson');
rho_min7 = corr(minimum7',usedcap7,'Type','Spearman');
r_min7 = corr(minimum7',usedcap7,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg7,3)),', R=',num2str(round(r_avg7,3))],...
    ['Median: ','\rho=',num2str(round(rho_med7,3)),', R=',num2str(round(r_med7,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max7,3)),', R=',num2str(round(r_max7,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min7,3)),', R=',num2str(round(r_min7,3))],...
    'Location','bestoutside')

figure
cap8 = Capacity.Cell8;
normcap8 = cap8/cap8(1); 
usedcap8 = 1-normcap8; 
scatter(avg8,usedcap8)
hold on
scatter(med8,usedcap8)
scatter(maximum8,usedcap8)
scatter(minimum8,usedcap8)
rho_avg8 = corr(avg8',usedcap8,'Type','Spearman');
r_avg8 = corr(avg8',usedcap8,'Type','Pearson');
rho_med8 = corr(med8',usedcap8,'Type','Spearman');
r_med8 = corr(med8',usedcap8,'Type','Pearson');
rho_max8 = corr(maximum8',usedcap8,'Type','Spearman');
r_max8 = corr(maximum8',usedcap8,'Type','Pearson');
rho_min8 = corr(minimum8',usedcap8,'Type','Spearman');
r_min8 = corr(minimum8',usedcap8,'Type','Pearson');
xlabel('Temperature')
ylabel('Used Capacity')
legend(['Average: ','\rho=',num2str(round(rho_avg8,3)),', R=',num2str(round(r_avg8,3))],...
    ['Median: ','\rho=',num2str(round(rho_med8,3)),', R=',num2str(round(r_med8,3))],...
    ['Maximum: ','\rho=',num2str(round(rho_max8,3)),', R=',num2str(round(r_max8,3))],...
    ['Minimum: ','\rho=',num2str(round(rho_min8,3)),', R=',num2str(round(r_min8,3))],...
    'Location','bestoutside')

figure
variance1(16) = []; 
scatter(variance1,usedcap1)
hold on
scatter(variance2,usedcap2)
scatter(variance3,usedcap3)
scatter(variance4,usedcap4)
scatter(variance5,usedcap5)
scatter(variance6,usedcap6)
scatter(variance7,usedcap7)
scatter(variance8,usedcap8)
rho_var1 = corr(variance1',usedcap1,'Type','Spearman');
r_var1 = corr(variance1',usedcap1,'Type','Pearson');
rho_var2 = corr(variance2',usedcap2,'Type','Spearman');
r_var2 = corr(variance2',usedcap2,'Type','Pearson');
rho_var3 = corr(variance3',usedcap3,'Type','Spearman');
r_var3 = corr(variance3',usedcap3,'Type','Pearson');
rho_var4 = corr(variance4',usedcap4,'Type','Spearman');
r_var4 = corr(variance4',usedcap4,'Type','Pearson');
rho_var5 = corr(variance5',usedcap5,'Type','Spearman');
r_var5 = corr(variance5',usedcap5,'Type','Pearson');
rho_var6 = corr(variance6',usedcap6,'Type','Spearman');
r_var6 = corr(variance6',usedcap6,'Type','Pearson');
rho_var7 = corr(variance7',usedcap7,'Type','Spearman');
r_var7 = corr(variance7',usedcap7,'Type','Pearson');
rho_var8 = corr(variance8',usedcap8,'Type','Spearman');
r_var8 = corr(variance8',usedcap8,'Type','Pearson');
xlabel('Variance of Temperature')
ylabel('Used Capacity')
legend(['Cell 1: ','\rho=',num2str(round(rho_var1,3)),', R=',num2str(round(r_var1,3))],...
    ['Cell 2: ','\rho=',num2str(round(rho_var2,3)),', R=',num2str(round(r_var2,3))],...
    ['Cell 3: ','\rho=',num2str(round(rho_var3,3)),', R=',num2str(round(r_var3,3))],...
    ['Cell 4: ','\rho=',num2str(round(rho_var4,3)),', R=',num2str(round(r_var4,3))],...
    ['Cell 5: ','\rho=',num2str(round(rho_var5,3)),', R=',num2str(round(r_var5,3))],...
    ['Cell 6: ','\rho=',num2str(round(rho_var6,3)),', R=',num2str(round(r_var6,3))],...
    ['Cell 7: ','\rho=',num2str(round(rho_var7,3)),', R=',num2str(round(r_var7,3))],...
    ['Cell 8: ','\rho=',num2str(round(rho_var8,3)),', R=',num2str(round(r_var8,3))],...
    'Location','bestoutside')