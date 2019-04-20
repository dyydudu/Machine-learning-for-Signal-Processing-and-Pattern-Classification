%% Least squares smoothing 

clc;
clear all;
close all;

%% Load data

load data_3.txt;

y = data_3;         % data value
N = length(y);

%% Display data

figure(1)
clf
plot(y)
title('Data')

%% Smoothing (degree = 3)
% D is the third-order difference matrix.
% It approximates the third-order derivative.
% In order to exploit fast banded solvers in Matlab,
% we define D as a sparse matrix using 'spdiags'.

e = ones(N, 1);
D = spdiags([e -3*e 3*e -e], 0:3, N-3, N); %third order derivative matrix

%%
% Observe the first and last corners of D.
% (D is too big to display, so we show
% the first and last corners only.)

%%
% First corner of D:

full(D(1:5, 1:5))

%%
% Last corner of D:

full(D(end-4:end, end-4:end))

%%
% Solve the least square problem

lam = 0.5;
F = lam*(speye(N)) +(D' * D);% F is a banded matrix
% 
x = F \ (lam*y);                              % Matlab uses a fast solver for banded systems)

% F = (speye(N)) +lam*(D' * D);% F is a banded matrix
% 
% x = F \ y;  


figure;
subplot(2,1,1);plot(y);title('Data')
subplot(2,1,2);plot(x);title('Least squares smoothing')