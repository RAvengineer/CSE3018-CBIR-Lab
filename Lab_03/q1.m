
% Variables
resultFile = 'rgb_image_features.xlsx';
total_images = 20;
total_features = 256*3;
dataset = zeros(total_images, total_features+1);
queryImgFileName = 'img9.jpg';
queryImgFeatures = imgFeatures(queryImgFileName);
EDwithQueryImg = zeros(total_images, 2);
total_solutions = 6;

% Generate Labels/Column headers for the dataset
redLabels = string(split(sprintf('R%d ', 0:255))).';
redLabels = redLabels(1:256);
greenLabels = string(split(sprintf('G%d ', 0:255))).';
greenLabels = greenLabels(1:256);
blueLabels = string(split(sprintf('B%d ', 0:255))).';
blueLabels = blueLabels(1:256);
labels = [
    "Image Name",...
    redLabels, greenLabels, blueLabels
];
writematrix(labels, resultFile);

% Retrieve the features for all images
for idx = 0:total_images-1
    imgFileName = sprintf("img%d.jpg", idx);
    features = imgFeatures(imgFileName);
    imgHistDetails = [imgFileName string(features)];
    % Store the features in a matrix
    dataset(idx+1, 1:total_features+1) = [idx features];
    % Store the features in an Excel file
    writematrix(imgHistDetails, resultFile, 'WriteMode','append');
end

for idx = 0:total_images-1
    % Retreive features for the test img
    testImgFeatures = dataset(idx+1, 2:total_features+1);
    % Calculate the Euclidean Distance b/w the features
    ED = sqrt(sum((queryImgFeatures - testImgFeatures).^2));
    % Store the data in a string matrix
    EDwithQueryImg(idx+1,:) = [idx ED];
end

% Sort the images w.r.t. to Euclidean Distance
EDwithQueryImg = sortrows(EDwithQueryImg, 2);

% Display the query image
subplot(3, 3, 2);
imshow(getImgFilePath(queryImgFileName));
title('Query Image');
% Display similar images
for idx = 1:total_solutions
    subplot(3, 3, idx + 3);
    imshow(getImgFilePath(sprintf('img%d.jpg',EDwithQueryImg(idx, 1))));
    title(sprintf('Similar Image %d', idx));
end

% Function to retrieve file path
function filePath = getImgFilePath(imgName)
    filePath = sprintf('../image_set_1/%s', imgName);
end

% Function to extract features of the given image
function features = imgFeatures(fileName)
    filePath = getImgFilePath(fileName);

    img = imread(filePath);
    
    % Seperate color channels
    redChannel = img(:,:,1);
    greenChannel = img(:,:,2);
    blueChannel = img(:,:,3);
    
    % Get histograms for each channel
    redHist = imhist(redChannel).';
    greenHist = imhist(greenChannel).';
    blueHist = imhist(blueChannel).';

    features = [redHist greenHist blueHist];
end
