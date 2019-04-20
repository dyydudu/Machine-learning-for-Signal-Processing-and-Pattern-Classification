%file for model training
clc;
clear all;
close all;
% reading the data
[m,n,X,d]=readWDBCdata(); % m: size of data, n:size of labels, X:data, d: labels.

lambda = 1; 
cvx_begin quiet
  variable w(n) 
  variable gama
  minimize (sum(max(1 - d.* (X * w - gama),0))/m + lambda * sum_square(w))
cvx_end

% Saving the weights (w,gama) in a mat file
save('try1.mat','w','gama')