
function [temp_data,E] = comp_data(im,patchsize)
block=1;
img1=im2double(rgb2gray(im));
[m,n]=size(img1);
row=floor(m/block);
col=floor(n/block);
extend_img=padarray(img1,[m n],'symmetric','both');    
for i=1:row
    for j=1:col
        startx=(i-1)*block+1-3+m;
        endx=(i-1)*block+1+4+m;
        starty=(j-1)*block+1-3+n;
        endy=(j-1)*block+1+4+n;
        A11=extend_img(startx:endx,starty:endy);
        A11=double(A11);
        [u d v]=svd(A11);
         B11=sum(d);  
         E(i,j)=B11(1);
         E2(i,j)=B11(2);
         E3(i,j)=B11(3);
         E4(i,j)=B11(4);
         E5(i,j)=B11(5);
         E6(i,j)=B11(6);
         E7(i,j)=B11(7);
        E8(i,j)=B11(8);      
    end
end
temp_data=E(:);
temp_data=[temp_data E2(:)];
temp_data=[temp_data E3(:)];
temp_data=[temp_data E4(:)];
temp_data=[temp_data E5(:)];
 temp_data=[temp_data E6(:)];
 temp_data=[temp_data E7(:)];
 temp_data=[temp_data E8(:)];
 [InputImg FinalMap map] = HiFST(im,1,0);
  for i=1:m
     for j=1:n
       E9(i,j)=map(i,j);
     end
 end
 temp_data=[temp_data E9(:)];
JK=img1;
I=padarray(JK,[m n],'symmetric','both');
w=8; 
 for i=1:m-1
     for j=1:n-1
      JK(i,j)=comp_extreme_point(I,i+m,j+n,w);
    end
 end
 for i=1:m
    for j=1:n
      E10(i,j)=JK(i,j);
    end
end
 temp_data=[temp_data E10(:)];
 E=0;
end










