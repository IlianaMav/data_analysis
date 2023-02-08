clear

i=1;
j=0;
n=2.^[2:17];
imax=length(n);

for i=1:imax
    
    n=;
    x=rand(1,n(i));
    k=find(x<0.5);
    tails=length(k);
    p(i)=tails/n(i);
    fprintf('n=%d  p=%.3f\n',n(i),p(i));
    i=i+1;
end

figure(1)
clf
plot(n,p)
xlabel('n')
ylabel('Relative Frequency-Probability')
hold on
yline(0.5,'r')
grid on
