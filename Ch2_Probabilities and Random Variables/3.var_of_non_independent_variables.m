% Show by simulation that when two random variables X and Y are not 
% independent, the property Var[X + Y] = Var[X] + Var[Y] does not hold. 
% To show this, consider a large number of values n from X and Y that 
% follow the bivariate normal distribution.

clear

n=10000;
mu=[0 0];
var1=1;
var2=1;
rho=0.5;
s12=rho*sqrt(var1*var2);

sigma=[var1 s12; s12 var2];
R=mvnrnd(mu,sigma,n);
x=R(:,1);
y=R(:,2);
sumxy=x+y;
varx=var(x);
vary=var(y);
varsumxy=var(sumxy);
d=varsumxy-(varx+vary);
fprintf('Var[X + Y] - (Var[X] + Var[Y])=%f\n',d)
