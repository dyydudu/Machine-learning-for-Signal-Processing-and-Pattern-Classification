function dec = userdefined_wave_reconstruction(s,l)
%haar wavelets decomposition and reconstruction filters 
[ld ,hd ,lr, hr] =wfilters('haar');
dec=s;
le = l(1:length(l)-1); %removing the length of input signal
for k = 1: length(l)-2
    %ca:approxiation coefficients
    %cd:decomposition coefficients
    ca = dec(1:le(1)); % the approximation coefficients(Low frequency) of decomposed signal are taken
    cd = dec(le(1)+1 : (le(1)+1)+le(2)-1);% the decomposition coefficients(high frequency)of decomposed signal are taken
    %upsample the ca.
    %convolve with the respective low pass and high pass reconstruction filters
    a = conv(upsample(ca,2),lr); 
    b = conv(upsample(cd ,2) ,hr);
    %addition of coefficients to get the previous level approximation coefficients
    ca=a+b;
    %removing the zeros
    ca=ca(1:find(ca,1,'last'));
    if(ca(1)==ca(2)) %if the coefficients are equal retain the coefficients.
        ca = ca(1);
    end
    cd=dec((le(1)+1)+le(2):end);
    dec=[ca cd];% appending to get the previous level cd and cv
    le = [length(ca) le(3:end)]; %previous level lengths
end
    