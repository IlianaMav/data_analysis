% The cut-off voltage of an alternating current of an insulating liquid 
% determines its dielectric resistance. Array V contains cut-off voltage
% (kV) observations in a circuit under certain conditions.
% [a] Calculate the 95% confidence interval for the variance of V
% [b] From older measurements the standard deviation of V was approximately
%     5kV. Using the sample below test the hypothesis H0: Standar deviation
%     of V is 5kV.
% [c] Calculate the 95% confidence interval of mean V.
% [d] Could the value V0=53kV for the mean V be disapproved?
% [e] Check the goodness of chi-square fit test for normal distribution
%     and calculate the corresponding p-value.

clear

V=[41 46 47 47 48 50 50 50 50 50 50 50 ...
    48 50 50 50 50 50 50 50 52 52 53 55 ...
    50 50 50 50 52 52 53 53 53 53 53 57 ...
    52 52 53 53 53 53 53 53 54 54 55 68];

a=0.05; % (1-a) confidence level
var_V=var(V);
mean_V=mean(V);

figure(1)
clf
histfit(V)
title('Histogram of cut-off voltage V')
xlabel('kV')
ylabel('counts')

%[4.a]
fprintf('[4.a]\n')
[h,p,ci]=vartest(V,var_V,a); %second input(var_V) doesn't affect ci,
...so I give a random value
fprintf('95%% confidence interval of variance: [%.2f,%.2f]\n\n',...
         ci(1),ci(2))

%[4.b]
fprintf('[4.b]\n')
std_old=5;
var_old=std_old^2;
[hv,pv,civ]=vartest(V,var_old,a);
fprintf('H0: sigma=%d (var=%d)\n',std_old,var_old)
fprintf('Rejection of H0 with p-value=%f (strong rejection)\n\n',pv)

%[4.c & 4.d]
fprintf('[4.c & 4.d]\n')
mean_V0=52;
[hm,pm,cim]=ttest(V,mean_V0,a);
fprintf('95%% confidence interval of mean: [%.2f,%.2f]\n\n', cim(1),cim(2))
fprintf('H0: mean=%d\n',mean_V0)
fprintf('Not rejection of H0\n')
fprintf('since p-value(=%f)>alpha(=%.2f)\n\n',pm,a)

%[4.e]
fprintf('[4.e]\n')
[h_norm,p_val]=chi2gof(V,'Alpha',a);
fprintf('Goodness of chi-square fit test for normal distribution:\n')
fprintf('Rejection of H0 with p-value=%f (strong rejection)\n\n',p_val)
