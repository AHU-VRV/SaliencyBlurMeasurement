function bilateral_result =bilateral_function(I)
  
if size(I,3)==3
   I=rgb2gray(I);
end
 %  I=double(I)/255.0;  
    w     =10;       % bilateral filter half-width  
%     sigma = [3 0.5]; % bilateral filter standard deviations  
      sigma = [1 0.1];
    I1=bfilter2(I,w,sigma);  
    
    bilateral_result=I1;
end

