clear all;
close all;

%% Initialization
% set the size of each block (size = block * 8)
% load the trained BP classifier
% test image
addpath(genpath('.'));
block=1;                
load net16;             
im =imread('images\42.jpg'); imgIndex = 42;     

%% Computing blur degrees via BP 
[img, blur_metric]=predict(im,block, net16);
FlattenedData = blur_metric(:)'; 
MappedFlattened = mapminmax(FlattenedData, 0, 1);
blur_metric = reshape(MappedFlattened, size(blur_metric));
     
%% Estimating the saliency
para = makeDefaultParameters;
smap = im2double(drfiGetSaliencyMap(im, para ));

%% Refine the blur degrees constrained by saliencies
for count=1:3
     img1=blur_metric;
     segments = vl_slic(im2single(im), 10,0.1);
     maxnum = max(max(segments));
     for i = 0 : maxnum
         neighter=get_neighbors(i,segments);
         [m n]=size(neighter);
         [avg x y avg12] = comp_averger(segments, i, imgIndex, smap, blur_metric);
          summ=avg;
          n1=1;
         for j=1:m
             [avg1 x1  y1 avg2]= comp_averger(segments, neighter(j,1), imgIndex, smap, blur_metric);
              neigh(j,1)=abs(avg-avg1);
              neight(j,1)=exp(-neigh(j,1)*10);
             [xm xn]=size(x);
             if(neight(j,1)>0.7)
             summ=summ+(neight(j,1)*avg2);
             n1=n1+1;
             end
         end
      c=max(neight);
      [xm xn]=size(x);
      for k=1:xm
      blur_metric(x(k,1),y(k,1))=(1-c)*img1(x(k,1),y(k,1))+c*summ/n1;
      end
    end
FlattenedData = blur_metric(:)'; 
MappedFlattened = mapminmax(FlattenedData,0,1); 
blur_metric = reshape(MappedFlattened, size(blur_metric));
end

%% Outputing the result by bilateral filtering
[m n]=size(blur_metric);
z=blur_metric;
 for k=1:m
      for l=1:n
          if(z(k,l)<0)
              z(k,l)=0;
          end
      end
 end 
I1=bilateral_function(z);
blur_metric=bilateral_function(I1);
FlattenedData = blur_metric(:)'; 
MappedFlattened = mapminmax(FlattenedData,0,1);
blur_metric = reshape(MappedFlattened, size(blur_metric));
imwrite(blur_metric, [num2str(imgIndex) '.jpg'], 'jpg');


