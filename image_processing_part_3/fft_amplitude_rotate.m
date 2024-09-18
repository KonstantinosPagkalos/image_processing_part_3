function [fft_amp_linear, fft_amp_log] = fft_amplitude_rotate(image)
%erwthma 3b
% This function calculates the 2D FFT of the input image after rotating it by
% 45 degrees, and then plots its amplitude (abs) in both linear and logarithmic
% scales, with the spatial point (0,0) located at the center.
% Inputs:
%   - image: a 2D matrix representing the input image
% Outputs:
%   - fft_amp_linear: a 2D matrix representing the linear amplitude of the
%                     FFT of the input image
%   - fft_amp_log: a 2D matrix representing the logarithmic amplitude of
%                  the FFT of the input image

% Rotate the input image by 45 degrees
rotated_image = imrotate(image, 45);

% Calculate the 2D FFT of the rotated image
fft_image = fft2(rotated_image);

% Shift the zero-frequency component to the center of the spectrum
fft_image = fftshift(fft_image);

% Calculate the amplitude of the FFT of the rotated image
fft_amp = abs(fft_image);

% Plot the linear amplitude of the FFT
figure;
subplot(1,2,1);
imagesc(fft_amp);
title('Linear amplitude');
colorbar;

% Plot the logarithmic amplitude of the FFT
fft_amp_log = log(fft_amp);
subplot(1,2,2);
imagesc(fft_amp_log);
title('Logarithmic amplitude');
colorbar;

% Output the linear and logarithmic amplitude matrices
fft_amp_linear = fft_amp;
fft_amp_log = fft_amp_log;
end
