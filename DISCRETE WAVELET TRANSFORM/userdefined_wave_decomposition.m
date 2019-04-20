function [sol ,l] = userdefined_wave_decomposition(x,Len) 
if(floor((log2(length(x))))==(log2(length(x))))
    c=[];
   %haar wavelets decomposition and reconstruction filters 
   [ld ,hd ,lr, hr] =wfilters('haar');
   s1=[length(x)]; % preserving the sequence length
   ca=[]; % approximation coefficients
 cd=[];% decomposition coefficients
 for L=1:Len
    %sequence is 1:convolve sequence is summed to get ca and cd.
   if(length(ca) == 1)
       ca =sum( conv(x,ld));
       cd = sum(conv(x,hd));
   else
   %if not convolve with low pass filter and then downsampled to get cd
   %and convolve with high pass filter and then downsampled to get cv
        ca = downsample(conv(x,ld),2,1);
        cd = downsample(conv(x,hd),2,1);
   end
   %lengths are preserved
    l=[length(ca) length(cd) s1];
    s1=l(2:end);
    c=[cd c];
    sol=[ca c];
    x=ca; % approximation coefficients go to further decomposition 
 end
 else
    disp('invalid input')
 end
