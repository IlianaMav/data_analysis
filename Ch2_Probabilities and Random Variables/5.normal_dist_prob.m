% The length X of the steel bars produced by a machine is known to follow a
% normal distribution X ∼ N(4, 0.01). In the quality check that follows 
% immediately after production, those steel bars with a length less than 
% 3.9 are rejected. What is the probability that a steel bar will be 
% rejected? Where should the limit be set in order to reject at most 1% of 
% the steel bars?

clear 

% Lower limit of rejection
x=3.9;
%Mean of X
mu=4;
%Variance of X
var=0.01;
%Standard Deviation of X
sigma=sqrt(var);

%Normal cumulative distribution function
p=normcdf(x,mu,sigma);
fprintf('Probability of rejection P(x<%.1f)=%.3f\n',x,p)

%Probability limit: 1% rejection using inverse cdf
p1=0.01;
x1=norminv(p1,mu,sigma);
fprintf('Lower limit of X in order P(x<x1)=0.01: x1=%.3f\n',x1)
