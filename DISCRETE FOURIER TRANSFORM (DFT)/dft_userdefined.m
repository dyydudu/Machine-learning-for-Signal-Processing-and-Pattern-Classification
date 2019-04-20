clear all
x=[2 4 8 16 32];
% x=[1 2 3 4 5 6 7 8];
if(log2(x))
    N=length(x);  % N is the length of signal
    n=0:N-1;   % n is the number of columns
    theta=2*pi*n/N;  % theta value are taken
    k=(0:N-1)';  % k is the number of rows
    W=exp(-i*k*theta)*x'  % coefficients of DFT 
    w=dftmtx(N)*x' % built-in command for dft coefficients 
    X=fft(x)'  % built-in command for fft 
else
disp('Not a valid signal')
end


