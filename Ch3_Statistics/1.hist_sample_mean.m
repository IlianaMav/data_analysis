% Use of fpoisson function to generate M samples of size n and create the 
% histogram of sample mean

clear

M=1000; %number of samples
nmatrix=2.^(4:14); %size of each sample
lamda=1;
%lamda=5;
imax=length(nmatrix);

for i=1:imax
n=nmatrix(i);
fprintf('%d)sample size=%d\n',i,n)
mean=fpoisson(lamda,n,M,i);
fprintf('mean=%.3f\n',mean)
end
