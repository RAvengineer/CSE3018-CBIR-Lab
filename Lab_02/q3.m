% Question 3
% Execute color plane slicing in RGB color space.

img = imread('images/img0.jpg');
subplot(2,3,2);
imshow(img);
title('Original Image');

redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

subplot(2,3,4);
imshow(redChannel);
title('Red Channel');

subplot(2,3,5);
imshow(greenChannel);
title('Green Channel');

subplot(2,3,6);
imshow(blueChannel);
title('Blue Channel');