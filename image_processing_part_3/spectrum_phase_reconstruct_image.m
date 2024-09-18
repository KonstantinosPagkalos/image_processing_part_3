function [f_spectrum, f_phase, f_spectrum_only, f_phase_only] = spectrum_phase_reconstruct_image(image)
% RECONSTRUCT_IMAGE Reconstructs an image from its spectrum and phase using
% the Fourier transform
% Inputs:
%   image: the input image
% Outputs:
%   f_spectrum: the reconstructed image using the spectrum only
%   f_phase: the reconstructed image using the phase only
%   f_spectrum_only: the image reconstructed using only the spectrum
%   f_phase_only: the image reconstructed using only the phase

% Show the original image
figure;
subplot(2, 3, 1); imshow(image, []); title('Original Image');

% Take the Fourier transform of the input image
F = fft2(image);

% Separate the magnitude spectrum and phase from F
magnitude_spectrum = abs(F);
phase_spectrum = angle(F);

% Reconstruct the image using the spectrum only
f_spectrum_only = ifft2(magnitude_spectrum);
f_spectrum_only = real(f_spectrum_only); % cast to real

% Reconstruct the image using the phase only
f_phase_only = ifft2(exp(1j * phase_spectrum));
f_phase_only = real(f_phase_only); % cast to real

% Reconstruct the image using both the spectrum and phase
f_spectrum = ifft2(magnitude_spectrum .* exp(1j * phase_spectrum));
f_spectrum = real(f_spectrum); % cast to real
f_phase = ifft2(magnitude_spectrum) .* exp(1j * phase_spectrum);
f_phase = real(f_phase); % cast to real

% Show the reconstructed images
subplot(2, 3, 2); imshow(f_spectrum, []); title('Reconstructed Image (Spectrum + Phase)');
subplot(2, 3, 3); imshow(f_phase, []); title('Reconstructed Image (Spectrum + Phase)');
subplot(2, 3, 5); imshow(f_spectrum_only, []); title('Reconstructed Image (Spectrum Only)');
subplot(2, 3, 6); imshow(f_phase_only, []); title('Reconstructed Image (Phase Only)');
end
