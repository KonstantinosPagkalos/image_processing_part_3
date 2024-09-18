function image2=imageisostathmish(imagedata)
p=imagehistogram(imagedata);
s=cumsum(p)*255;
sk=round(s);
max(sk)
image2=zeros(size(imagedata));
for rk=0:255
  temp =  find(imagedata ==rk);
  image2(temp)=sk(rk+1);

end

p2=imagehistogram(image2);

%figure ; plot(p);
hold on ; subplot(1,2,1); plot(p2);
hold on ; subplot(1,2,2); imshow(uint8(image2));





end 