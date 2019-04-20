clc;
clear all;
close all;

load data_1.txt;  %loading the data
y = data_1(:,2);         % y values
t = data_1(:,1);         % t values

N = length(y); %taking the length of y

figure(1)
plot(y)     %ploting y data
title('Data')

e = ones(N, 1);
A = [e t t.^2]; %A matrix
F = A' * A;  
x = F \ A' * y; %least square solution

figure(2)
plot(x) %ploting the obtained solution

figure;
subplot(2,1,1);plot(y);title('Data')
subplot(2,1,2);plot(x);title('Least squares solution')

