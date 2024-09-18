function reconstruction_of_2_images(f1, f2)

% Take the Fourier transform of f1 and f2
F1 = fft2(f1);
F2 = fft2(f2);

% Compute the amplitude and phase of f1 and f2
ABS1 = abs(F1);
ABS2 = abs(F2);
PHASE1 = exp(1i*angle(F1));
PHASE2 = exp(1i*angle(F2));

% Reconstruct the images
NEW_F1 = ABS2 .* PHASE1;
NEW_F2 = ABS1 .* PHASE2;
NEW_f1 = real(ifft2(NEW_F1));
NEW_f2 = real(ifft2(NEW_F2));

% Show the original images and reconstructed images
subplot(2, 2, 1);
imshow(f1, []);
title('Image f1');
subplot(2, 2, 2);
imshow(f2, []);
title('Image f2');
subplot(2, 2, 3);
imshow(NEW_f1, []);
title('Reconstructed from f1');
subplot(2, 2, 4);
imshow(NEW_f2, []);
title('Reconstructed from f2');

end
