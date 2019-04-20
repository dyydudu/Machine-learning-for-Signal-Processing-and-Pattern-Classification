
clc;
clear all;
close all
%% Load data

load data_2.txt;

y = data_2;         % data value

%% Display data

figure(1)
plot(y)
title('Data')

L = 100;      

%% 4th order linear predictor

N = length(y);
H = [y(4:N-1) y(3:N-2) y(2:N-3) y(1:N-4)];
b = y(5:N);
a = (H' * H) \ (H' * b)         % a : coefficients of linear predictor

g1 = [y; zeros(L, 1)];
for i = N+1:N+L
    g1(i) = a(1) * g1(i-1) + a(2) * g1(i-2) + a(3) * g1(i-3) +a(4) *g1(i-4);
end


figure
subplot(2,1,1);plot(y);title('Data')
subplot(2,1,2);plot(g1);line([N N], [-2 2], 'linestyle', '--');title('Data and predicted values (deg(4))')


