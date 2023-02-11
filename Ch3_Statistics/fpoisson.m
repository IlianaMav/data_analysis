function y=fpoisson(lamda,n,M,i)
% fpoisson function generates M samples of size n from Poisson distribution
% with a given parameter lanmda, and calculate the sample mean for each of 
% the M samples. Then it will make the histogram of the M sample means and 
% give as output the average of the M sample means.

x=poissrnd(lamda,n,M);
meanx=mean(x);
y=mean(meanx); 

figure(i)
clf
histfit(meanx)
title(['Distribution of sample mean (sample size: ', num2str(n), ')'])
xlabel('Sample mean')
ylabel('Counts')

end
