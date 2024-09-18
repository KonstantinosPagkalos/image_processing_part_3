function restored_image = restore_image(input_image)
    % Add salt-and-pepper noise to 20% of pixels
    noise_image = input_image;
    [rows, cols, channels] = size(input_image);
    for i = 1:rows
        for j = 1:cols
            if rand() < 0.2
                for k = 1:channels
                    if rand() < 0.5
                        noise_image(i, j, k) = 0;
                    else
                        noise_image(i, j, k) = 255;
                    end
                end
            end
        end
    end

    % Restore image using mean filter
    restored_image_mean = zeros(size(input_image));
    kernel_size = 3;
    half_kernel = floor(kernel_size/2);
    for i = 1:rows
        for j = 1:cols
            if i <= half_kernel || j <= half_kernel || i > rows - half_kernel || j > cols - half_kernel
                restored_image_mean(i, j, :) = noise_image(i, j, :);
            else
                for k = 1:channels
                    temp = noise_image(i-half_kernel:i+half_kernel, j-half_kernel:j+half_kernel, k);
                    sorted_temp = sort(temp(:));
                    restored_image_mean(i, j, k) = sorted_temp(floor(kernel_size^2/2)+1);
                end
            end
        end
    end

    % Restore image using median filter
    restored_image_median = zeros(size(input_image));
    kernel_size = 3;
    half_kernel = floor(kernel_size/2);
    for i = 1:rows
        for j = 1:cols
            if i <= half_kernel || j <= half_kernel || i > rows - half_kernel || j > cols - half_kernel
                restored_image_median(i, j, :) = noise_image(i, j, :);
            else
                for k = 1:channels
                    temp = noise_image(i-half_kernel:i+half_kernel, j-half_kernel:j+half_kernel, k);
                    restored_image_median(i, j, k) = median(temp(:));
                end
            end
        end
    end

    % Show the original image, the noisy image with salt-and-pepper noise, the restored image using mean filter, 
    % and the restored image using median filter
    figure;
    subplot(2, 2, 1);
    imshow(uint8(input_image));
    title('Original Image');
    
    subplot(2, 2, 2);
    imshow(uint8(noise_image));
    title('Noisy Image (Salt-and-Pepper Noise)');
    
    subplot(2, 2, 3);
    imshow(uint8(restored_image_mean));
    title('Restored Image (Mean Filter)');
    
    subplot(2, 2, 4);
    imshow(uint8(restored_image_median));
    title('Restored Image (Median Filter)');

    % Return the restored image using median filter
    restored_image = uint8(restored_image_median);
end
