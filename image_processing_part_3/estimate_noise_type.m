function [noise_type, noise_params] = estimate_noise_type(image)

    % calculate mean and variance of image
    mean_val = mean(image(:));
    var_val = var(double(image(:)));
    
    % calculate histogram of image
    num_bins = 256;
    hist_data = imagehistogram(image);
    
    % check for salt-and-pepper noise
    sp_ratio = sum(image(:)==0 | image(:)==255) / numel(image);
    if sp_ratio > 0.05
        noise_type = "salt-and-pepper";
        noise_params = sp_ratio;
        figure, imshow(image), title(noise_type);
        return
    end
    
    % check for gaussian noise
    if mean_val > 100 && var_val < 100
        noise_type = "gaussian";
        noise_params = [mean_val, var_val];
        figure, imshow(image), title(noise_type);
        return
    end
    
    % check for poisson noise
    if mean_val < 50 && max(hist_data) > 0.05
        noise_type = "poisson";
        noise_params = mean_val;
        figure, imshow(image), title(noise_type);
        return
    end
    
    % check for speckle noise
    if mean_val > 100 && var_val > 100
        noise_type = "speckle";
        noise_params = [mean_val, var_val];
        figure, imshow(image), title(noise_type);
        return
    end
    
    % check for impulse noise
    if mean_val < 50 && max(hist_data) < 0.05
        noise_type = "impulse";
        % calculate Pa and Pb
        hist_data_smoothed = smooth(hist_data, 5);
        [~, max_idx] = max(hist_data_smoothed);
        [~, min_idx] = min(hist_data_smoothed);
        Pa = max(hist_data_smoothed(max_idx-10:max_idx+10));
        Pb = max(hist_data_smoothed(min_idx-10:min_idx+10));
        noise_params = [Pa, Pb];
        figure, imshow(image), title(noise_type);
        return
    end
    
    % if no noise type is found, return empty values
    noise_type = "";
    noise_params = [];
    
end
