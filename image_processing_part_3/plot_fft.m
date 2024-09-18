function image2 = imageisostathmish(imagedata)
    % Clip input image to range [0,255]
    imagedata = max(min(imagedata, 255), 0);
    
    % Calculate histogram and cumulative sum
    p = imagehistogram(imagedata);
    s = cumsum(p) * 255;
    sk = round(s);
    
    % Apply transformation
    image2 = sk(imagedata + 1);
    
    % Calculate histogram of transformed image
    p2 = imageisostathmish(image2);
    
    % Plot histograms and transformed image
    subplot(1,2,1); plot(p2);
    subplot(1,2,2); imshow(uint8(image2));
end
