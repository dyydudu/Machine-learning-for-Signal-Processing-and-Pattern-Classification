x =[1,2,3,4]
h =[1,1]
m = length(x); % length of the x sequence
n = length(h); %length of h sequnce
% making the sequences to same size
X = [x,zeros(1,n)]; %appending remaining length with 0
H = [h,zeros(1,m)]; % appending remaining length with 0 
for i=1:m+n-1 % the convolved sequence is of size m+n-1
  Y(i)=0; 
  for j=1:m
      if(i-j+1>0)
          Y(i)=Y(i)+X(j)*H(i-j+1); %flipping H multiplying it with X and adding it to Y
      else
      end
  end
end
Y

