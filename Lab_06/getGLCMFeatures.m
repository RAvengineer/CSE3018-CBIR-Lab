function features = getGLCMFeatures(imgFilePath, levels)
%GETGLCMFEATURES Function to retrieve GLCM Features of an image
%   With D=1 & given quantization levels
%   Returns an 1x12 matrix of Features containing energy, entropy, contrast, idm
%   for 3 directions (Horizontal, Vertical & Leading Diagonal)
%   Format: [H-nrg, H-s, H-cntrst, H-idm, V-nrg, V-s, ..., L-idm]

% Set default value of levels as 32
if ~exist('levels', 'var')
    levels = 32;
end
directions = 3;

img = imread(imgFilePath);
img = im2gray(img);
[h, w] = size(img);

% Initialize the GLCM
GLCM = zeros(levels, levels, directions);

% Quantize the image
partitions = 256/levels;
img = imquantize(img, partitions:partitions:256);

for i=1:h
    for j=1:w
        % Horizontal
        if j ~= w
            GLCM(img(i,j),img(i,j+1),1) = GLCM(img(i,j),img(i,j+1),1) + 1;
        end
        % Vertical
        if i ~= h
            GLCM(img(i,j),img(i+1,j),2) = GLCM(img(i,j),img(i+1,j),2) + 1;
        end
        % Leading Diagonal
        if i ~= h && j ~=w
            GLCM(img(i,j),img(i+1,j+1),3) = GLCM(img(i,j),img(i+1,j+1),3) + 1;
        end
    end
end

features = zeros(4,3);

% Calculate features for resp. directions
for d=1:directions
    GLCMDR = GLCM(:,:,d); % GLCM Direction Resp.
    % Normalize
    GLCMDR = GLCM(:,:,d)./sum(sum(GLCMDR));
    
    % Calculate energy
    tmp = GLCMDR.^2;
    features(1,d) = sum(tmp(:));
    
    % Calculate entropy
    tmp = GLCMDR.*log(GLCMDR);
    tmp(isnan(tmp)) = 0; % To avoid calc errors
    features(2,d) = -1 * sum(tmp(:));
    
    % Calculate contrast & IDM
    for i=1:levels
        for j=1:levels
            % Contrast
            features(3,d) = features(3,d) + ((i-j)^2*GLCMDR(i,j));
            % Inverse Difference Moment
            features(4,d) = features(4,d) + (GLCMDR(i,j)/(1+(i-j)^2));
        end
    end
end

features = features(:);

end

