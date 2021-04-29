function feat = lbp(img, distance)
%LBP Extract Local Binary Features
%   Extract Local Binary Pattern histogram features
%   Pattern for a grayscale image
    img = im2gray(img);
    [h,w] = size(img);
    
    feat = zeros(1, 2^(8*distance));
    
    cnv_size = 2*distance + 1; % cnv_size -> convertor matrix size
    cnv = zeros(cnv_size); % cnv -> convertor
    % Add numbers in top & bottom
    for j=1:cnv_size
        cnv(1,j) = (j) - 1; % top
        cnv(end, j) = (2*(cnv_size-1) + cnv_size - j + 1) - 1; % bottom
    end
    % Add numbers in left & right
    for i=2:cnv_size-1
        cnv(i, cnv_size) = (cnv_size + i - 1) - 1; % right
        cnv(i, 1) = (8*distance - i + 2) - 1;
    end
    
    % Raise each element to the power of 2 for binary conversion
    cnv = 2.^cnv;
    % Set all elements to zero, except the edge elements
    cnv(2:end-1, 2:end-1) = 0;
    % |~~ Convertor generated! (45 min to develop this algo :|) ~~|
    
    for i=distance+1:h-distance
        for j=distance+1:w-distance
            % Extract the window
            window = img(i-distance:i+distance,j-distance:j+distance);
            window(2:end-1, 2:end-1) = 0;
            % Thresholding
            tmp = zeros(cnv_size);
            tmp(window >= img(i,j)) = 1;
            % Convert to binary value using the convertor
            tmp = tmp.*cnv;
            pixel_value = sum(tmp(:));
            % Increment the bin value
            feat(1, pixel_value+1) = feat(1, pixel_value+1) + 1;
        end
    end
    
end

