2.
%% Row wise missing samples estimation using least square approach
u1=[]; % empty matrix to store each row wise missing sample estimation
for j=1:400
    y=u0(j,:)'; % taking each row of the inpaint image matrix
    N = length(y); % finding the length of the each row 
    e = ones(N, 1); %column vector of ones
    D = spdiags([e -2*e e], 0:2, N-2, N); 
 

    full(D(1:5, 1:5));

    full(D(end-4:end, end-4:end));
    k = isfinite(y); % k = logical vector, indexes known values ,gives 1
    S = speye(N); 
    S(~k, :) = []; 
    Sc = speye(N); % Sc : complement of S
    Sc(k, :) = []; % empty the rows where values are present
    L = sum(~k); % L : number of missing values

    v = -(Sc * (D' * D) * Sc') \ ( Sc * D' * D * S' * y(k)); % v : estimated samples

    x = zeros(N,1);
    x(k) = y(k); % where values are present known values of data are put
    x(~k) = v; % where values are not present newly estimated values are put
    u1=[u1;x']; % Appending each rows after missing sample estimation

end
figure % new figure
imshow(u1) % plotting the image after rowwise missing sample
% estimation.
title('Row wise missing sample estimation')
%% Column wise missing samples estimation using least square approach
u2=[]; % empty matrix to store each column wise missing sample
% estimation
for j=1:400
    y=u0(:,j); % taking each column of the inpaint image matrix
    N = length(y); % finding the length of the each column

    D = spdiags([e -2*e e], 0:2, N-2, N); % Sparse diagonal matrix containing

    k = isfinite(y); % k = logical vector, indexes known values ,gives 1
    S = speye(N); %sparse identity matrix of size same as size of given
    S(~k, :) = []; % S : sampling matrix, (empty rows where values are not present )
    Sc = speye(N); % Sc : complement of S
    Sc(k, :) = []; % empty the rows where values are present
    L = sum(~k); % L : number of missing values
    v = -(Sc * (D' * D) * Sc') \ ( Sc * D' * D * S' * y(k)); % v : estimated samples

    x = zeros(N,1);
    x(k) = y(k); % where values are present known values of data are put
    x(~k) = v; % where values are not present newly estimated values are put
    u2=[u2 x]; % Appending each columns after columnwise missing sample estimation

end
figure % new figure
imshow(u2) % plotting the image after columnwise missing sample estimation.
title('Column wise missing sample estimation')
u= (u1+u2)./2; 
figure % new figure
imshow(u) % plotting the image after columnwise missing sample

title(' Inpainted image after taking avg of row wise and column wise missing sample estimation')
