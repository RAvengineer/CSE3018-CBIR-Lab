% Question 4
%{
In each of the plane of R, G, B, extract statistical features like mean, 
standard deviation, variance, skewness, kurtosis. 
A single image will have 5 features in each color plane. 
So totally 15 color based features for every image; 
Also extract no. of rows, no. of columns and 
no. of color channels in an images. So 3 features.
Altogether, every image will contain 18 features.
%}

img = imread('../image_set_1/img0.jpg');

redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

% Get size, height, width, no. of channels
imgSize = size(img);
imgHeight = imgSize(1);
imgWidth = imgSize(2);
numOfChannels = imgSize(3);
imgSize = sprintf('%d×%d×%d', imgHeight, imgWidth, numOfChannels);

% Get Mean for all channels
meanRed = mean2(redChannel);
meanGreen = mean2(greenChannel);
meanBlue = mean2(blueChannel);

% Get Standard Deviation for all channels
stdRed = std2(redChannel);
stdGreen = std2(greenChannel);
stdBlue = std2(blueChannel);

% Get Variance for all channels
varRed = var(double(redChannel(:)));
varGreen = var(double(greenChannel(:)));
varBlue = var(double(blueChannel(:)));

% Get skewness for all channels
skewRed = skewness(redChannel(:));
skewGreen = skewness(greenChannel(:));
skewBlue = skewness(blueChannel(:));

% Get kurtosis for all channnels
kurtRed = kurtosis(redChannel(:));
kurtGreen = kurtosis(greenChannel(:));
kurtBlue = kurtosis(blueChannel(:));

fprintf('Size: %s\t', imgSize);
fprintf('Height: %d\t', imgHeight);
fprintf('Width: %d\t', imgWidth);
fprintf('No. of channels: %d\n', numOfChannels);

fprintf('\nMean for channel:\n');
fprintf('Red: %f\tGreen: %f\tBlue: %f\n', meanRed, meanGreen, meanBlue);

fprintf('\nStandard Deviation for channel:\n');
fprintf('Red: %f\tGreen: %f\tBlue: %f\n', stdRed, stdGreen, stdBlue);

fprintf('\nVariance for channel:\n');
fprintf('Red: %f\tGreen: %f\tBlue: %f\n', varRed, varGreen, varBlue);

fprintf('\nSkewness for channel:\n');
fprintf('Red: %f\tGreen: %f\tBlue: %f\n', skewRed, skewGreen, skewBlue);

fprintf('\nKurtosis for channel:\n');
fprintf('Red: %f\tGreen: %f\tBlue: %f\n', kurtRed, kurtGreen, kurtBlue);