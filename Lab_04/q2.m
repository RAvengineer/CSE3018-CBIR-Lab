
% Start stopwatch
tic

% Variables
resultFile = 'rgb_image_features.xlsx';
total_images = 20;
levels = 256;
distance_vector = [1 3];
total_features = 2*levels*size(distance_vector,2);
dataset = zeros(total_images, total_features+1);
queryImgFileName = 'img13.jpg';
queryImgFeatures = imgFeatures(queryImgFileName,distance_vector,levels);
CSDwithQueryImg = zeros(total_images, 2);
total_solutions = 6;

% Generate Labels/Column headers for the dataset
labels = strings(1, total_features + 1);
labels(1,1) = "Image Name";
for d = 1:size(distance_vector, 2)
    offset = 256*2*(d-1);
    for bin = 0:255
        h_idx = offset + 0*256 + (bin + 1) + 1;
        labels(1, h_idx) = sprintf("H-%d-%d,%d", d, bin, bin);
        v_idx = offset + 1*256 + (bin + 1) + 1;
        labels(1, v_idx) = sprintf("V-%d-%d,%d", d, bin, bin);
    end
end
writematrix(labels, resultFile);

% Retrieve the features for all images
for idx = 0:total_images-1
    imgFileName = sprintf("img%d.jpg", idx);
    features = imgFeatures(imgFileName, distance_vector, levels);
    imgDetails = [imgFileName string(features)];
    % Store the features in a matrix
    dataset(idx+1, 1:total_features+1) = [idx features];
    % Store the features in an Excel file
    % writematrix(imgDetails, resultFile, 'WriteMode','append');
end

for idx = 0:total_images-1
    % Retreive features for the test img
    testImgFeatures = dataset(idx+1, 2:total_features+1);
    % Calculate the Chi-Squared Distance b/w the features
    CSD_raw = ((queryImgFeatures - testImgFeatures).^2)./queryImgFeatures;
    % The above matrix can have NaN due to zero counts in queryImgFeatures
    % So, used rmmissing to clean those missing values
    CSD = sum(rmmissing(CSD_raw));
    % Store the data in a string matrix
    CSDwithQueryImg(idx+1,:) = [idx CSD];
end

% Sort the images w.r.t. to Euclidean Distance
CSDwithQueryImg = sortrows(CSDwithQueryImg, 2);

% Display the query image
subplot(3, 3, 2);
imshow(getImgFilePath(queryImgFileName));
title('Query Image');
% Display similar images
for idx = 1:total_solutions
    subplot(3, 3, idx + 3);
    imshow(getImgFilePath(sprintf('img%d.jpg',CSDwithQueryImg(idx, 1))));
    title(sprintf('Similar Image %d', idx));
end

% Display the total features & time elapsed
fprintf("Total features: %d\n", total_features);
% Stop stopwatch
toc

% Function to retrieve file path
function filePath = getImgFilePath(imgName)
    filePath = sprintf('../image_set_1/%s', imgName);
end

% Function to extract features of the given image
function features = imgFeatures(fileName, distance_vector, levels)
    if nargin == 2
        levels = 256;
    end
    filePath = getImgFilePath(fileName);

    img = imread(filePath);
    % Convert image to grayscale
    % img = im2gray(img);
    img = img(:,:,1);
    
    % Use custom auto-correlogram function: acg
    [hc, vc] = acg(img, distance_vector, levels);
    
    % Fill data back into the return parameter
    features = zeros(1, 2*levels*size(distance_vector,2));
    for d = 1:size(distance_vector, 2)
        start_idx = (d-1) * 2 * levels + 1;
        end_idx = (d) * 2 * levels;
        features(1, start_idx:end_idx) = [hc(:,d).' vc(:,d).'];
    end
end

%{
** References:
* https://www.mathworks.com/matlabcentral/answers/179142-how-can-i-remove-nan-values-from-a-matrix
%}