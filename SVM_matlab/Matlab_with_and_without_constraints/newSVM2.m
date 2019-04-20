% Matlab code for svm classification without contraints.

clc;
clear all;

X=[1 0 0 2 2 2 3 -1;0 1 0 2.5 2 3 2 0]';
d=[-1 -1 -1 -1 1 1 1 1]';
lambda = 1;
[m,n]=size(X);
cvx_begin quiet
  variable w(n) 
  variable gama
  minimize (sum(max(1 - d.* (X * w - gama),0))/m + lambda * sum_square(w))
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

 save('try1.mat','w','gama')