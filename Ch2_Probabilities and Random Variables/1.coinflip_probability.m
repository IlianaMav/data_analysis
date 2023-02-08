% coinflip_probability
% Confirm the definition of probability as the limit of relative frequency 
% as the number of trials approaches infinity. Simulate the flip of a coin 
% n times using a random number generator, either from a uniform discrete 
% distribution (for 'heads' and 'tails'), or from a uniform continuous 
% distribution in the interval [0, 1] using a threshold of 0.5 
% (e.g. a number less than 0.5 is 'heads' and greater is 'tails'). 
% Repeat the experiment for increasing n and calculate each time the ratio
% of 'tails' to n trials. Make the corresponding graphical representation 
% of the ratio for different n.

clear

% Create an array of the of values for the sample size as powers of 2
n=2.^(2:17)';
% Maximum Value for iterator i used in for-loop below
imax=length(n);
% Memory allocation for relative frequency p and sample size ni
p=zeros(imax,1);
ni=zeros(imax,1);

for i=1:imax
    
    ni=n(i);
    % Generate ni random numbers from the continius uniform distribution
    % in the interval (0,1)
    x=rand(ni,1);
    % Find which of these numbers are larger than 0.5 (coin flip: tails)                                   
    k=find(x<0.5); 
    %and count them
    tails=length(k);
    % Calculate the relative frequency of tails p
    p(i)=tails/ni;
    % Output: values of n and p 
    fprintf('n=%d  p=%.3f\n',ni,p(i));
    
end

% Create a figure with the plot of relative frequency (p) of tails as a 
% function of sample size (n)
figure(1)
clf
plot(log2(n),p)
xlabel('log2(n)')
ylabel('Relative Frequency->Probability')
hold on
yline(0.5,'r')
grid on
