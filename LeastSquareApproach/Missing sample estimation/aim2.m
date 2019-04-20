clc;
clear all;
close all
y =[0.7342,0.1234,NaN,0.2345,NaN,0.1324,NaN,0.2326,NaN,0.7345]';          % y : data value
N = length(y);          % N : the length of the data in y
n = 1:N;                % n : the indexes from 1 to N
k = isfinite(y);  % k  : logical vector.1 where elements are finite valve.0 where elements are infinite(NaN)
S = speye(N);     % S  : sparse matrix with size N.
S(~k, :) = []    % S  : sampling matrix in which samples are missing removing that row
Sc = speye(N);    % Sc : sparse matrix with size N.
Sc(k, :) = []    % the rows at which values are present are omitted
