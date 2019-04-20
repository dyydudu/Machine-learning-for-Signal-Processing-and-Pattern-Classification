function c=confusionMatrix(tlabel,plabel)
q=0;tn=[];
s=0;fn=[];
r=0;fp=[];
t=0;tp=[];
for i=1:length(tlabel)
    if(tlabel(i)==plabel(i))
        if(plabel(i)==1)
            q=q+1;
            tn=[tn i];
        else
            t=t+1;
            tp=[tp i];
        end
    else
        if(plabel(i)==1)
            r=r+1;
            fp=[fp i];
        else
            s=s+1;
            fn=[fn i];
        end
    end
end
tn
tp
fp
fn
c=[t r;s q]
end

        
        
        



