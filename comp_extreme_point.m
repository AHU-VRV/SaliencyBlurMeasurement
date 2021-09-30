function [num ]=comp_extreme_point(im,i,j,w)
num=0;
for m=i:i+w-3
    for n=j:j+w-3
      if(im(m+1,n+1)>im(m,n)&&im(m+1,n+1)>im(m,n+1)&&im(m+1,n+1)>im(m,n+2)&&im(m+1,n+1)>im(m,n+1)&&im(m+1,n+1)>im(m+1,n+2)&&im(m+1,n+1)>im(m+2,n)&&im(m+1,n+1)>im(m+2,n+1)&&im(m+1,n+1)>im(m+2,n+2)) 
                 num=num+1;
      end
    end
end
   
end 









