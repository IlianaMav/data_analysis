% Show that the Central Limit Theorem holds with a simulation. Assume n=100 
% random variables from a uniform distribution over the interval [0,1] and
% let Y be their mean. Calculate N = 10000 values of Y and plot a histogram
% of their values along with the curve of the normal distribution.

clear

n=100;
N=1000;
bins=50;
x=rand(n,N);
y=mean(x);
figure
clf
histfit(y,bins);
title('Distribution of mean y of uniform distributed x')
xlabel('mean')
ylabel('counts')
