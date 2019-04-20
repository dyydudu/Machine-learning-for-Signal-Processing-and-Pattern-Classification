clear all
clc

load('cardio.mat')
d=y;
e=ones(size(X,1),1);
cvx_begin quiet
    variable w(21);
    variable gama;
    variable psii(1831);  % matlab will assume psii as a column vector
    minimize sum(psii)
    subject to
        d.*(X*w-gama*e)>=1-psii;
        psii>=0;
cvx_end

labels=sign(X*w-gama) % predict the class label using the given calssifier