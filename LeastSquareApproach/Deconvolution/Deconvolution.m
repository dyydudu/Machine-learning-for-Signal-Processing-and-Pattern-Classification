% Signal Deconvolution using Least square 

clc;
clear all;
close all;

% Create data

N = 300;
n = (0:N-1)';                            
% n : discrete-time index

w = 5;
n1 = 70;
n2 = 130;
x = 2.1 * exp(-0.5*((n-n1)/w).^2) - 0.5*exp(-0.5*((n-n2)/w).^2).*(n2 - n);  
% x : input signal

h = n .* (0.9 .^n) .* sin(0.2*pi*n);      
% h : impulse response


% Output data

randn('state', 0);                         
% Set state for reproducibility

y = conv(h, x);
y = y(1:N);                                
% y : output signal (noise-free)

yn = y + 0.2 * randn(N, 1);               
% yn : output signal (noisy)


figure(1)
subplot(4,1,1);plot(x);title('Input signal');YL1 = [-2 3];ylim(YL1);
subplot(4,1,2);plot(h);title('Impulse response');
subplot(4,1,3);plot(y);YL2 = [-7 13];ylim(YL2);title('Output signal (noise-free)');
subplot(4,1,4);plot(yn);ylim(YL2);title('Output signal (noisy)');

% Convolution matrix H
%Create convolution matrix H and 
%verify that H*x is the same as y

H = convmtx(h, N);
H = H(1:N, :);                              
% H : convolution matrix

%Verify that H*x is the same as y
e = y - H * x  % should be zero
max(abs(e))


g = H \ y;
%1. analyze the varaible 'g' and state the reason for the analysis.
% while exceuting 'g' there is a  warning
% Warning: Matrix is singular to working precision.
% g is computing inv(H)*y.
% the warning is given when computing g because of inv(H). 
% inv(H) = (1/(det(H) )* adj(H) 
% inv(H) has Inf values and det(H) =0 so inverse does not exist.
% inv(H) = 1/0 *inf = inf

% inv(H)*y=inf *y which is sparse in nature  
% inf*0 = Nan and therefore g is of vector with Nan.


lam = 0.1;
%2. Complete the code referring to the document for noise-free deconvolution
g=inv(H'*H+lam*eye(N))*H'*y;

%Diagonal loading (noisy)

lam1 = 0.1;
e = ones(N,1);
D = spdiags([e -2*e e], 0:2, N-2, N);
%3. Complete the code referring to the document for deconvolution in presence of noise (use the control paramter assigned in lam1)
g1 = inv(H'*H+lam1*eye(N))*H'*yn;

lam2 = 1.0;
%4. Complete the code referring to the document for deconvolution in presence of noise (use the control paramter assigned in lam2)
g2 = inv(H'*H+lam2*eye(N))*H'*yn;


lam3 = 5.0;
%5. Complete the code referring to the document for deconvolution in presence of noise (use the control paramter assigned in lam3)
g3=inv(H'*H+lam3*eye(N))*H'*yn;



%6. Interpret the below results 

figure(2)
subplot(4,1,1);plot(g);ylim(YL1);title(sprintf('Deconvolution for noise free (diagonal loading, \\lambda = %.2f)', lam));
subplot(4,1,2);plot(g1);ylim(YL1);title(sprintf('Deconvolution for noisy (diagonal loading, \\lambda = %.2f)', lam1));
subplot(4,1,3);plot(g2);YL2 = [-7 13];ylim(YL2);title(sprintf('Deconvolution for noisy (diagonal loading, \\lambda = %.2f)', lam2))
subplot(4,1,4);plot(g3);ylim(YL1);title(sprintf('Deconvolution for noisy (diagonal loading, \\lambda = %.2f)', lam3));

%subplot1

% In this subplot the noise free deconvolution is performed, y is used.
% As lam=0.1 which is very small value, it forces the x to be same as y 
% and also forces it to have low energy. 
% that is why g is same as x(input signal).

% subplot2.
% In this subplot  the noised deconvolution is performed, yn is used.
% lam1= 0.1 which is very small ,it forces the x to be same as the noisy signal yn 


% subplot3.
% In this subplot the noised deconvolution is performed, yn is used.
% lam2= 1 which is small ,it forces the x to be consistent with y
% and also with low energy ans 
% thats why the signal is as x but with low enery of noise .

% subplot4.
% In this subplot the noised deconvolution is performed, yn is used.
% lam3=5, energy does not lowers much 
% and that is why the signal is almost as input signal but with noise.



%% Derivative regularization (noisy)

e = ones(N, 1);
D = spdiags([e -2*e e], 0:2, N-2, N);       % second-order difference


lam =2.0;
%7. Complete the code referring to the document for deconvolution in presence of noise (use the control paramter assigned in lam)
g=inv(H'*H+lam*D'*D)*H'*yn;


%Interpret the below results 

figure (3);
subplot(2,1,1);plot(x);title('input signal');YL1 = [-2 3];ylim(YL1);
subplot(2,1,2);plot(g);title(sprintf('Deconvolution (derivative regularization, \\lambda = %.2f)', lam));


% lam =2  replicates the nosiy y but does not reduces the energy of x more. 
% The denoising is possible because the lam value is good enough lower the energy of x. 



