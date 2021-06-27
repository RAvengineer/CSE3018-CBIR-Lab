% Question 5
% Write in an Excel File, in a format like the one given below

resultFile = 'image_features.xls';

labels = [
    "Image Name",...
    "Red Mean", "Red Variance", "Red Standard Deviation",...
    "Red Skewness", "Red Kurtosis",...
    "Green Mean", "Green Variance", "Green Standard Deviation",...
    "Green Skewness", "Green Kurtosis",...
    "Blue Mean", "Blue Variance", "Blue Standard Deviation",...
    "Blue Skewness", "Blue Kurtosis",...
    "No. of Rows", "No. of Columns", "No. of Channels",...
];
writematrix(labels, resultFile);

for idx = 0:19
    imgName = sprintf("img%d.jpg", idx);
    filePath = sprintf('../image_set_1/%s', imgName);
    
    img = imread(filePath);

    redChannel = img(:,:,1);
    greenChannel = img(:,:,2);
    blueChannel = img(:,:,3);

    % Get size, height, width, no. of channels
    imgSize = size(img);
    imgHeight = imgSize(1);
    imgWidth = imgSize(2);
    numOfChannels = imgSize(3);

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
    
    imgData = [
        imgName, ...
        meanRed, varRed, stdRed, skewRed, kurtRed, ...
        meanGreen, varGreen, stdGreen, skewGreen, kurtGreen, ...
        meanBlue, varBlue, stdBlue, skewBlue, kurtBlue, ...
        imgHeight, imgWidth, numOfChannels, ...
    ];
    writematrix(imgData, resultFile, 'WriteMode','append');
end