function[neighbors]=get_neighbors(label,ans)
[m,n]=size(ans);
[x,y]=find(ans==label);
minx=min(x);
maxx=max(x);
miny=min(y);
maxy=max(y);
if(minx==1)
    minx=1;
else
    minx=minx-1;
end
if(maxx==m)
    maxx=m;
else
    maxx=maxx+1;
end
if(miny==1)
    miny=1;
else
    miny=miny-1;
end
if(maxy==n)
    maxy=n;
else
    maxy=maxy+1;
end

rect=ans(minx:maxx,miny:maxy);
neighbors=unique(rect);
neighbors(neighbors==label)=[];
end
