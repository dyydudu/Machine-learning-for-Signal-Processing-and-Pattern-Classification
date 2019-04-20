% file for testing and calculating different statistical measurement
clear all
clc
% loading the file which has the weights of the model.
load('try1.mat')

% Loading the test data
[m,n,X,d]=readWDBCdata(); 
labels=sign(X*w-gama); % predict the class label 
% sign() is the calssifier

%plotconfusion(d,labels)

confMat=confusionmat(d,labels); % PRE DEFINED Matlab function
conf=confusionMatrix(d,labels);  % USER DEFINED 

%precision
for i =1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(:,i));
end
Precision=sum(precision)/size(confMat,1);

% recall
for i =1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(i,:));
end
recall(isnan(recall))=[];
Recall=sum(recall)/size(confMat,1);

% F1-score
F_score=2*Recall*Precision/(Precision+Recall);









