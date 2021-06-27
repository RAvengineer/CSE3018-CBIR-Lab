% Implement a CBIR using Tamura features and Euclidean distance metric.
% Code below lines marked with |#| depend on the dataset you choose.

clc;
% |#| Extract filenames of the images
imgFiles = dir(getImgFilePath("*.tiff"));

% Variables
resultFile = 'tamura_image_features.xlsx';
total_images = numel(imgFiles);
total_features = 6;
dataset = zeros(total_images, total_features+1);
queryImgFileName = imgFiles(40).name;
queryImgFeatures = getTamuraFeatures(getImgFilePath(queryImgFileName));
EDwithQueryImg = zeros(total_images, 2);
total_solutions = 6;

% Set Labels/Column headers for the dataset
labels = [
    "Image Name",...
    "contrast", "directionality", "coarseness", ...
    "linelikeness", "regularity", "roughness", ...
];
writematrix(labels, resultFile);

% Retrieve the features for all images
for idx = 1:total_images
    clc;
    imgFileName = imgFiles(idx).name;
    fprintf('%d/%d \t Analyzing: %s',idx, total_images, imgFileName);
    features = getTamuraFeatures(getImgFilePath(imgFiles(idx).name));
    imgDetails = [imgFileName string(features)];
    % Store the features in a matrix
    dataset(idx, 1:total_features+1) = [idx features];
    % Store the features in an Excel file
    writematrix(imgDetails, resultFile, 'WriteMode','append');
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
    imgSetPath = "../image_set_2/";
    filePath = sprintf('%s%s', imgSetPath, imgName);
end