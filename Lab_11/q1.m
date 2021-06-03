% Implement a CBIR using HOG features and Euclidean distance metric.
% HOG: Histogram of Oriented Gradients
% Code below lines marked with |#| depend on the dataset you choose.

% Add hog_feature_vector folder in the current path
addpath(genpath('./hog_feature_vector'));

clc;
% |#| Extract filenames of the images
imgFiles = dir(getImgFilePath("*.jpg"));

% Variables
total_images = numel(imgFiles);
queryImgFileName = imgFiles(13).name;
queryImgFilePath = getImgFilePath(queryImgFileName);
queryImgFeatures = hog_feature_vector(imread(queryImgFilePath));
total_features = size(queryImgFeatures, 2);
dataset = zeros(total_images, total_features+1);
EDwithQueryImg = zeros(total_images, 2);
total_solutions = 6;


% Retrieve the features for all images
for idx = 1:total_images
    clc;
    imgFileName = imgFiles(idx).name;
    fprintf('%d/%d \t Analyzing: %s',idx, total_images, imgFileName);
    imgPath = getImgFilePath(imgFiles(idx).name);
    features = hog_feature_vector(imread(imgPath));
    % Since HOG has different feature vector size for different images,
    % that can cause problems while adding to a matrix of defined size.
    % Hence, add only those images to dataset matrix, which have same HOG
    % feature vector size as the query_image
    if size(features, 2) == size(queryImgFeatures, 2)
        % Store the features in a matrix
        dataset(idx, 1:total_features+1) = [idx features];
    end
end
clc;
for idx = 1:total_images
    % Retreive features for the test img
    testImgFeatures = dataset(idx, 2:total_features+1);
    % Calculate the Euclidean Distance b/w the features
    ED = sum((queryImgFeatures - testImgFeatures).^2);
    % Store the data in a string matrix
    EDwithQueryImg(idx,:) = [idx ED];
end

% Sort the images w.r.t. to Euclidean Distance
EDwithQueryImg = sortrows(EDwithQueryImg, 2);

% Display the query image
subplot(3, 3, 2);
imshow(getImgFilePath(queryImgFileName));
title(sprintf('Query Image\n%s',queryImgFileName));
% Display similar images
for idx = 1:total_solutions
    subplot(3, 3, idx + 3);
    tmp = imgFiles(EDwithQueryImg(idx, 1)).name;
    imshow(getImgFilePath(tmp));
    title(sprintf('Similar Image %d\n%s', idx, tmp));
end

% |#| Function to retrieve file path
function filePath = getImgFilePath(imgName)
    imgSetPath = "../image_set_1/";
    filePath = sprintf('%s%s', imgSetPath, imgName);
end