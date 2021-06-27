% Implement a CBIR using CCV features and City Block distance metric.
% Code below lines marked with |#| depend on the dataset you choose.

% |#| Extract filenames of the images
imgFiles = dir(getImgFilePath("*.tiff"));

% Variables
resultFile = 'ccv_image_features.xlsx';
total_images = numel(imgFiles);
levels = 16;
total_features = levels*2;
dataset = zeros(total_images, total_features+1);
queryImgFileName = imgFiles(14).name;
queryImgFeatures = getCCV(imread(getImgFilePath(queryImgFileName))).';
queryImgFeatures = queryImgFeatures(levels + 1: levels*3);
CBDwithQueryImg = zeros(total_images, 2);
total_solutions = 6;

% Generate Labels/Column headers for the dataset
coherentLabels = string(split(sprintf('C-%d ', 0:levels-1))).';
coherentLabels = coherentLabels(1:levels);
incoherentLabels = string(split(sprintf('NC-%d ', 0:levels-1))).';
incoherentLabels = incoherentLabels(1:levels);
labels = [
    "Image Name",...
    coherentLabels, incoherentLabels
];
writematrix(labels, resultFile);

% Retrieve the features for all images
for idx = 1:total_images
    imgFileName = imgFiles(idx).name;
    features = getCCV(imread(getImgFilePath(imgFiles(idx).name))).';
    features = features(levels + 1: levels*3);
    imgDetails = [imgFileName string(features)];
    % Store the features in a matrix
    dataset(idx, 1:total_features+1) = [idx features];
    % Store the features in an Excel file
    writematrix(imgDetails, resultFile, 'WriteMode','append');
end

for idx = 1:total_images
    % Retreive features for the test img
    testImgFeatures = dataset(idx, 2:total_features+1);
    % Calculate the City-Block/Manhattan Distance b/w the features
    CBD = sum(abs(queryImgFeatures - testImgFeatures));
    % Store the data in a string matrix
    CBDwithQueryImg(idx,:) = [idx CBD];
end

% Sort the images w.r.t. to City-Block/Manhattan Distance
CBDwithQueryImg = sortrows(CBDwithQueryImg, 2);

% Display the query image
subplot(3, 3, 2);
imshow(getImgFilePath(queryImgFileName));
title('Query Image');
% Display similar images
for idx = 1:total_solutions
    subplot(3, 3, idx + 3);
    imshow(getImgFilePath(imgFiles(CBDwithQueryImg(idx, 1)).name));
    title(sprintf('Similar Image %d', idx));
end

% |#| Function to retrieve file path
function filePath = getImgFilePath(imgName)
    imgSetPath = "../image_set_2/";
    filePath = sprintf('%s%s', imgSetPath, imgName);
end