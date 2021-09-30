function [output_args,colormap_img] = predict( I,block,net)
patchsize=15;
block_blur=10;
if size(I,3)==3
    J=rgb2gray(I);
end
[m,n,dim]=size(J);
colormap_img=double(zeros(m,n));
[testdata,E]=comp_data(I,patchsize);
FlattenedData = testdata(:)';
MappedFlattened = mapminmax(FlattenedData,0,1);
testdata = reshape(MappedFlattened, size(testdata));
testresult = sim(net,testdata');                    
result=reshape(testresult,m,n);
[p,q]=size(result);
for i=1:p
    for j=1:q
    colormap_img(i,j)=result(i,j);
    end
end
   
 
for i=1:m
    for j=1:n
          if colormap_img(i,j)==0.0
              if i==1
              colormap_img(i,j)=colormap_img(i,j-1);
              else
                  colormap_img(i,j)=colormap_img(i-1,j);
              end
          end
    end
end
output_args=I;
end

function [count,index_flag1,index_flag2]=get_max_value(temp,compare_value)
count=0;
index_flag1=0;
index_flag2=0;
 for i=1:length(temp)
    if temp(i)<compare_value
       count=count+1;
       index_flag1=i;
    else
       index_flag2=i; 
    end
 end
end


function  temp=blur_detect(temp,threshold)
[m,n]=size(temp);
blur_count=0;
sum_count=m*n;
min_blur=min(min(temp));
max_blur=max(max(temp));
sum_x=0;
sum_y=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        if temp(i,j)<threshold
            sum_x=i+sum_x;
            sum_y=j+sum_y;
            blur_count=blur_count+1;
        else
            x=x+i;
            y=y+j;
        end
    end
end

clear_count=sum_count-blur_count;
if blur_count/sum_count<0.3&&blur_count~=0&&sum_x/blur_count>m/3&&sum_x/blur_count<m*2/3&&sum_y/blur_count>m/3&&sum_y/blur_count<m*2/3
    for i=1:m
    for j=1:n
        if temp(i,j)<threshold
            temp(i,j)=max_blur;
        end
    end
    end
end
if blur_count/sum_count>0.7&&x/clear_count>m/3&&x/clear_count<m*2/3&&y/clear_count>m/3&&y/clear_count<m*2/3
    for i=1:m
    for j=1:n
        if temp(i,j)>threshold
            temp(i,j)=min_blur;
        end
    end
end
end

end
