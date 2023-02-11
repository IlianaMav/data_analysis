% Create n values of exponential distribution with mean tau=15 min. Using 
% this sample calculate the 95% confidence interval for the mean tau and
% check if it cointains tau=15. Sample size n=5 and n=100.

clear

tau=15;
M=1000;
n=100;
%n=5;
a=0.05;
in=0;

h_matrix=zeros(M,1); %test decisions
ci_matrix=zeros(M,2); %confidence bounds

for i=1:M
    x=exprnd(tau,n,1);
    [h,p,ci]=ttest(x,tau,a);
    h_matrix(i)=h;
    ci_matrix(i,:)=ci;
    if tau>ci_matrix(i,1) && tau<ci_matrix(i,2)
       in=in+1;
    end
end

perc=sum(in)/M; %Probability of real time in 95% confidence interval
p_rej=sum(h_matrix)/M; %Probability of rejection

fprintf('Percentage of tau=15 in 95%% confidence interval: %.1f%%\n',perc*100)
fprintf('H0: tau=15\n')
fprintf('Percentage of rejection of H0: %.1f%%\n',p_rej*100)
%prob->a, accurate test
