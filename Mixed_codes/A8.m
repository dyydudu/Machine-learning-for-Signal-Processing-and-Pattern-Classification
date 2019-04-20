clear all
clc

load('cardio.mat')
d=y;
d(d==0) = -1; % converting the labels of 0 to -1

e=ones(size(X,1),1);
A = (d*d').*(X*X');

cvx_begin quiet
    variables u(1831)
    minimize (((1/2)*u'*A*u) - (e'*u));
    subject to
        u'*y == 0;
        u>=0;
cvx_end

w = sum(u * d' *X);% calculating w

gamma = (w*X(99,:)') + 1; % calculating gamma

predict = sign(w*X'-gamma); % predicting the labels
