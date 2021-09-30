function y=Figureout(I,x1,x2,y1,y2)
    for i=y1:y2
        I(x1,i,:)=255;
        I(x2,i,:)=255;
    end
    for i=x1+1:x2-1
        I(i,y1,:)=255;
        I(i,y2,:)=255;
    end
    y=I;
end