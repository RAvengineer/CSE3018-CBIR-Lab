% Read in original RGB image.
rgbImage = imread('c2_rgb.jpg');

% Extract color channels.
redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel

% Display them all.
subplot(3, 3, 2);
imshow(rgbImage);
fontSize = 20;
title('Original RGB Image') 
subplot(3, 3, 4);
imshow(redChannel);
title('Red Channel')
subplot(3, 3, 5);
imshow(greenChannel);
title('Green Channel')
subplot(3, 3, 6);
imshow(blueChannel);
title('Blue Channel')
subplot(3,3,1);
imshow(rgb2hsv(rgbImage));
title('HSV Mapping')
subplot(3,3,3);
imshow(rgb2gray(rgbImage));
title('Gray Mapping')
subplot(3, 3, 7);
imshow(255 - redChannel);
title('Cyan Channel')
subplot(3, 3, 8);
imshow(255 - greenChannel);
title('Magenta Channel')
subplot(3, 3, 9);
imshow(255 - blueChannel);
title('Yellow Channel')
