% Question 2
%{
Transform this image into other color spaces like CMY, HSV and Grayscale. Show
all of them in a 2X2 subplot.
%}

img = imread('images/img0.jpg');
subplot(2,2,1);
imshow(img);
title('Original Image');

subplot(2,2,2);
imshow(255 - img);
title('CMY-scale Image');

subplot(2,2,3);
imshow(rgb2hsv(img));
title('HSV-scale Image');

subplot(2,2,4);
imshow(rgb2gray(img));
title('Grayscale Image');
