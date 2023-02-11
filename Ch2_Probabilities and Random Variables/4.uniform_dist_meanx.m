% Investigate computationally the truth of E[1/X] = 1/E[X]; for X from a 
% uniform continuous distribution in the interval [1, 2] by calculating the
% corresponding mean values for increasing number of repetitions n. Make an
% appropriate graphical representation for both mean values and different 
% n. What happens if the range of the uniform distribution is [0, 1] or 
% [-1, 1].

%%Interval [1,2]
clear

a=1;
b=2;
n=2.^(2:17);
imax=length(n);

meanx=zeros(imax,1);
meany=zeros(imax,1);
d=zeros(imax,1);

for i=1:imax
    m=n(i);
    x=(b-a).*rand(1,m)+a;
    y=1./x;
    meanx(i)=mean(x);
    meany(i)=mean(y); %y=1/x
    d(i)=meany(i)-(1/meanx(i));
end

figure(1)
clf;
plot(log2(n),1./meanx,'.-b')
hold on;
plot(log2(n),meany,'.-r')
xlabel('Sample Size log2(n)')
legend('1/E[X]','E[1/X]')
title('Interval [1,2]')
%% Interval [0,1]

a=0;
b=1;
n=2.^(2:17);
imax=length(n);

meanx=zeros(imax,1);
meany=zeros(imax,1);
d=zeros(imax,1);

for i=1:imax
    m=n(i);
    x=(b-a).*rand(1,m)+a;
    y=1./x;
    meanx(i)=mean(x);
    meany(i)=mean(y); %y=1/x
    d(i)=meany(i)-(1/meanx(i));
end

figure(2)
clf;
plot(log2(n),1./meanx,'.-b')
hold on;
plot(log2(n),meany,'.-r')
xlabel('Sample Size log2(n)')
legend('1/E[X]','E[1/X]')
title('Interval [0,1]')
%% Interval [-1,1]

a=0;
b=1;
n=2.^(2:17);
imax=length(n);

meanx=zeros(imax,1);
meany=zeros(imax,1);
d=zeros(imax,1);

for i=1:imax
    m=n(i);
    x=(b-a).*rand(1,m)+a;
    y=1./x;
    meanx(i)=mean(x);
    meany(i)=mean(y); %y=1/x
    d(i)=meany(i)-(1/meanx(i));
end

figure(3)
clf;
plot(log2(n),1./meanx,'.-b')
hold on;
plot(log2(n),meany,'.-r')
xlabel('Sample Size log2(n)')
legend('1/E[X]','E[1/X]')
title('Interval [-1,1]')
