function feat = getTamuraFeatures(imgFilePath)
%GETTAMURAFEATURES Extracts the Tamura features of the given image
%   Returns Tamura Features of the given image as a 1x6 matrix in order of
%   Contrast,Directionality,Coarseness,Linelikeness,Regularity,Roughness
%   References: 
%   https://github.com/MarshalLeeeeee/Tamura-In-Python/tree/master/referenced-matlab-code

feat = double(zeros(1,6));
img = imread(imgFilePath);
img = im2gray(img);

DLMI = double(img(:)); % Double Linear Matrix Image

% Contrast
alpha = 0.25;
feat(1, 1) = var(DLMI)/(kurtosis(DLMI)^alpha);
% Directionality
[feat(1, 2), sita] = directionality(img);
% Coarseness
feat(1, 3) = coarseness(img, 5);
% Linelikeness
feat(1, 4) = linelikeness(img, sita, 4);
% Regularity
feat(1, 5) = regularity(img, 64);
% Roughness
feat(1, 6) = feat(1, 1) + feat(1, 3);

end