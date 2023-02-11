function y=fexp(tau,n,M,i)
% fexp function generates M samples of size n from exponential distribution
% with a given parameter tau, and calculate the sample mean for each of 
% the M samples. Then it will make the histogram of the M sample means and 
% give as output the average of the M sample means.

x=exprnd(tau,n,M);
meanx=mean(x);
y=mean(meanx); 

figure(i)
clf
histfit(meanx)
title(['Distribution of sample mean (sample size: ', num2str(n), ')'])
xlabel('Sample mean')
ylabel('Counts')

end
