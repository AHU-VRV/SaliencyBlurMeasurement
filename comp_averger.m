function      [avg x y  avg1] =comp_averger(label,ans1,zz,img1,img2)
sum1=0;
sum2=0;
segments = label;
i = ans1;
          [x,y]=find(segments==i);
          [xm xn]=size(x);
          for k=1:xm
         sum1=sum1+img1(x(k,1),y(k,1));
          end
         avg=sum1/xm;
         for k=1:xm
         sum2=sum2+img2(x(k,1),y(k,1));
          end
         avg1=sum2/xm;