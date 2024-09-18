function [fft_amp_linear, fft_amp_log] = fft_amplitude(image)
%erwthma 3a
% This function calculates the 2D FFT of the input image, and then plots its
% amplitude (abs) in both linear and logarithmic scales, with the spatial
% point (0,0) located at the center.
% Inputs:
%   - image: a 2D matrix representing the input image
% Outputs:
%   - fft_amp_linear: a 2D matrix representing the linear amplitude of the
%                     FFT of the input image
%   - fft_amp_log: a 2D matrix representing the logarithmic amplitude of
%                  the FFT of the input image

% Calculate the 2D FFT of the input image
fft_image = fft2(image);

% Shift the zero-frequency component to the center of the spectrum
fft_image = fftshift(fft_image);

% Calculate the amplitude of the FFT of the input image
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
