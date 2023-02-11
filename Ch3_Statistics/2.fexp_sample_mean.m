% Use of fexp function to generate M samples of size n and create the 
% histogram of sample mean. Check for different values of tau if the
% center of sample mean equals value of tau.

clear

M=1000; %number of samples
nmatrix=2.^(4:14); %size of each sample
tau=1;
%tau=5;
imax=length(nmatrix);

for i=1:imax
n=nmatrix(i);
fprintf('%d)sample size=%d\n',i,n)
mean=fexp(tau,n,M,i);
fprintf('mean=%.3f\n',mean)
end
