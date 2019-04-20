clc;
clear all;
close all

y =[0.7342,0.1234,NaN,0.2345,NaN,0.1324,NaN,-0.2326,NaN,0.7345]'                   % y : data value

N = length(y);  % the length of the data in y(10)
n = 1:N;        % the indexes from 1 to N 


%% Define matrix D
% D represents the second-order derivitive
% (2nd-order difference).
% D is defined as a sparse matrix so that Matlab
% subsequently uses fast solvers for banded systems.

e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N-2, N);

%% Define matrices S and Sc

k = isfinite(y);  % k  : logical vector.1 where elements are finite valve.0 where elements are infinite(NaN)
S = speye(N);     % S  : sparse matrix with size N.
S(~k, :) = [];    % S  : sampling matrix in which samples are missing removing that row
Sc = speye(N);    % Sc : sparse matrix with size N.
Sc(k, :) = [];    % the rows at which values are present are omitted
number_of_missing_values = sum(~k)% count the number of missing data

%% Estimate missing data
% Least square estimation of missing data.
% Note that the system matrix is banded so the system
% equations can be solved very efficiently with a fast banded system solver.
% By defining S and D as sparse matrices, Matlab calls a fast
% banded system solver by default.

v = -(Sc * (D' * D) * Sc') \ ( Sc * (D') * D * S' * y(k));    
% v : estimated samples 
% y : input matrix
% D : second order derivative matrix 
% S : a matrix with values 1 at present data
% Sc: complement of S which contains 1 at places of missing data

%% Fill in unknown values
% Place the estimated samples into the signal.

x = zeros(N,1); % x variable with zeros
                % length of x=length of input matrix(N)
x(k) = y(k);    % original signal is preserved
x(~k) = v;      % Estimated values are insert at places of missing data
figure(1);

figure(1);
subplot(3,1,1);plot(n, y,'k.');title('Signal with 4 missing samples');
subplot(3,1,2);plot(n, y, 'k.', n(~k), x(~k) ,'k*');title('Estimated samples');
subplot(3,1,3);plot(n, x );title('Final signal');
