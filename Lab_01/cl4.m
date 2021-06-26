% Read in original RGB image.
rgbImage = imread('c2_rgb.jpg');

% Extract color channels.
redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel

str_mean_red = sprintf('Mean of Red Channel: %d',mean(mean(redChannel)));
str_mean_green = sprintf('Mean of Green Channel: %d',mean(mean(greenChannel)));
str_mean_blue = sprintf('Mean of Blue Channel: %d',mean(mean(blueChannel)));
disp(str_mean_red);
disp(str_mean_green);
disp(str_mean_blue);
