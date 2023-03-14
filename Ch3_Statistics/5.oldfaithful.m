% The geyser Old Faithful in America is one of the most famous geysers
% for its size and regularity of eruptions. In file eruption.dat there are
% columns. 
% 1st: Waiting time for the next eruption (1989)
% 2nd: Duration of eruption (1989)
% 3rd: Waiting time for the next eruption (2006)
% For each variable:
% [a] Calculate the 95% confidence interval of its standard deviation and 
% check if it is 10 min for the waiting time and 1 min for
% the duration.
% [b] Calculate the 95% confidence interval of its mean and check if it is
% 75 min for waiting time and 2.5 min for duration.
% [c] Check the goodness of chi-square fit test for normal distribution
%     and calculate the corresponding p-value.
% 
% Extra Question:
% Using data for 1989, check if the following claim from Wikipedia is 
% acceptable:
% "With an error of 10 minutes, Old Faithful will erupt 65 minutes after an
% eruption lasting less than 2.5 minutes or 91 minutes after an eruption 
% lasting more than 2.5 minutes."

clear

data=load('eruption.dat');

a=0.05; % (1-a) confidence level
std0=[10 1 10];
var0=std0.^2;
mean0=[75 2.5 75];
s={'Waiting time 1989', 'Duration 1989', 'Waiting time 2006'};

for i=1:3
    
    %histogram
    figure(i)
    clf
    histfit(data(:,i))
    xlabel('min')
    ylabel('counts')
    title(s{i})
    
    %test
    [hv(i),pv(i),civ]=vartest(data(:,i),var0(i),a);
    [hm(i),pm(i),cim]=ttest(data(:,i),mean0(i),a);
    [hx2(i),px2(i)]=chi2gof(data(:,i),'Alpha',a);
    
    fprintf(s{i})
    fprintf('\n95%% confidence interval of variance: [%.2f,%.2f]\n', ...
             civ(1),civ(2))
    fprintf('95%% confidence interval of standard deviation: [%.2f,%.2f]\n',...
             sqrt(civ(1)),sqrt(civ(2)))
    fprintf('H0: sigma=%1.f --- p-value=%10e\n',std0(i),pv(i))
    fprintf('95%% confidence interval of mean: [%.2f,%.2f]\n', ...
             cim(1),cim(2))
    fprintf('H0: mean=%.1f --- p-value=%10e\n',mean0(i),pm(i))
    fprintf('Chi-square fit test for normal distribution:\n')
    fprintf('Rejection of H0 with p-value=%10e (strong rejection)\n\n',px2(i))

end

%[EXTRA QUESTION]
fprintf('-----EXTRA QUESTION-----\n')
std1=10;
var1=std1^2;
mean1=[65 91];
dur1=2.5;

index=find(data(:,2)<dur1);
data_low=data(index,1);
index=find(data(:,2)>dur1);
data_high=data(index,1);
s={'Waiting time 1998 (duration<2.5)','Waiting time 1998 (duration>2.5)'};

for j=1:2
    
    if j==1
        wt=data_low;
    else
        wt=data_high;
    end
    
    %histogram
    figure(j+i)
    clf
    histfit(wt)
    xlabel('min')
    ylabel('counts')
    title(s{j})
    
    %test
    [hv1(j),pv1(j),civ1]=vartest(wt,var1,a);
    [hm1(j),pm1(j),cim1]=ttest(wt,mean1(j),a);
    [hx21(j),px21(j)]=chi2gof(wt,'Alpha',a);
    
    fprintf(s{j})
    fprintf('\n95%% confidence interval of variance: [%.2f,%.2f]\n', ...
             civ1(1),civ1(2))
    fprintf('95%% confidence interval of standard deviation: [%.2f,%.2f]\n',...
             sqrt(civ1(1)),sqrt(civ1(2)))
    fprintf('H0: sigma=%1.f --- p-value=%10e\n',std1,pv1(j))
    fprintf('95%% confidence interval of mean: [%.2f,%.2f]\n', ...
             cim1(1),cim1(2))
    fprintf('H0: mean=%.1f --- p-value=%10e\n',mean1(j),pm1(j))
    fprintf('Chi-square fit test for normal distribution: p-value=%10e \n\n',...
             px21(j))

end
