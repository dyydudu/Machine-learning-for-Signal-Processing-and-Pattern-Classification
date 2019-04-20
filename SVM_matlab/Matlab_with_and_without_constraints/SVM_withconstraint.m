% Matlab code for svm classification with contraints.

clear all;
clc;

X=[1 0 0 2 2 2 3 -1;0 1 0 2.5 2 3 2 0]';
d=[-1 -1 -1 -1 1 1 1 1]';
e=ones(8,1);
cvx_begin quiet
variable w(2);
variable gama;
variable psii(8);  % matlab will assume psii as a column vector
minimize sum(psii)
subject to
    d.*(X*w-gama*e)>=1-psii;
    psii>=0;
cvx_end
figure

plot(X(1:4,1), X(1:4,2),'*');% plot-1 points
hold on
plot(X(5:8,1), X(5:8,2),'o');% plot+1 points
hold on
x1=-1:3;
x2=-(w(1)/w(2))*x1+(gama/w(2)); 
plot(x1,x2); % draw the classifier line

hold on
x2=-(w(1)/w(2))*x1+((-1+gama)/w(2));
plot(x1,x2) % draw the lower bounding line

hold on
x2=-(w(1)/w(2))*x1+((1+gama)/w(2));
plot(x1,x2) % draw the upper bounding line

save('try2.mat','w','gama')

