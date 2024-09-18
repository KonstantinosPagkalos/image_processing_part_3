function p=imagehistogram(imagedata)

[image_length , image_width] =  size(imagedata);
 
total_number_of_pixels = image_length*image_width;
t = [1:256];
values_pos =  zeros(size(t));
index=1;
for i=0:255
    temp =  find(imagedata ==i);
    p(index) = (length(temp))/(total_number_of_pixels);
    index=index+1;
end
figure; subplot(1,2,1); plot(p);
hold on ; subplot(1,2,2); imshow(uint8(imagedata));
end