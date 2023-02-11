% Generate n random numbers from exponential distribution with parameter
% lamda=1 using the inverse from uniform distribution. Create the histogram
% of these numbers and the curve of exponential distribution 
% f(x)=lamda*exp(-lamda*x) in the same plot. 

clear

n=1000;
lamda=1;

%Generate n random numbers from uniform distribution
x=rand(1,n);
%Inverse from uniform distribution
y=-(1/lamda)*log(1-x);
%Probability Distribution Function (pdf) of exponential distribution
f=lamda*exp(-lamda*y);

figure(1)
clf;
histogram(y,'Normalization','pdf')
hold on
scatter(y,f,'.r');
xlabel('y')
ylabel('pdf of exponential distribution')
legend('Histogram','pdf: f=lamda*exp(-lamda*y)')
