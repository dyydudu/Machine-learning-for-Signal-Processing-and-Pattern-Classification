clear all
clc
A=[1 0.5 3 4;1 0.5 3 5]';
d=[-1 -1 1 1]';
e=ones(size(A,1),1);

cvx_begin quiet
    variable w(2);
    variable gama;
    dual variable u;
    minimize (w'*w)
    subject to
        u:d.*(A*w-gama*e)>=e; 
cvx_end
format bank
disp('w vector')
w
disp('gama')
gama
disp('u vector (lagange multipliers)')
u

plot(A(1:2,1), A(1:2,2),'*');% plot-1 points
hold on
plot(A(3:4,1), A(3:4,2),'o');% plot+1 points
hold on
x1=-1:4;
x2=-(u(1)/u(3))*x1+(gama/u(3)); 
plot(x1,x2); % draw the classifier line

hold on
x2=-(u(1)/u(3))*x1+((-1+gama)/u(3));
plot(x1,x2) % draw the lower bounding line

hold on
x2=-(u(1)/u(3))*x1+((1+gama)/u(3));
plot(x1,x2) % draw the upper bounding line