% matlab code for testing 

clear all
clc

load('try1.mat')

X=[1 0 0 2 2 2 3 -1;0 1 0 2.5 2 3 2 0]';
d=[-1 -1 -1 -1 1 1 1 1]';

labels=sign(X*w-gama); % predict the class label % sign () is my calssifier

%plotconfusion(d,labels)

confMat=confusionmat(d,labels) 


%precision
for i =1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(:,i));
end
Precision=sum(precision)/size(confMat,1)

% recall
for i =1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(i,:));
end
recall(isnan(recall))=[];
Recall=sum(recall)/size(confMat,1)

% F1-score
F_score=2*Recall*Precision/(Precision+Recall)

clear all;
load('try2.mat')

X=[1 0 0 2 2 2 3 -1;0 1 0 2.5 2 3 2 0]';
d=[-1 -1 -1 -1 1 1 1 1]';
labels=sign(X*w-gama); % predict the class label % sign () is my calssifier

%plotconfusion(d,labels)

confMat=confusionmat(d,labels) 


%precision
for i =1:size(confMat,1)
    precision(i)=confMat(i,i)/sum(confMat(:,i));
end
Precision=sum(precision)/size(confMat,1)

% recall
for i =1:size(confMat,1)
    recall(i)=confMat(i,i)/sum(confMat(i,:));
end
recall(isnan(recall))=[];
Recall=sum(recall)/size(confMat,1)

% F1-score
F_score=2*Recall*Precision/(Precision+Recall)







