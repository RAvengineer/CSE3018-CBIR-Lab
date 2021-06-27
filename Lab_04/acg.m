function [horizontal_count, vertical_count] = acg(img, distances, levels)
    % Check if levels provided or not
    if nargin == 2
        levels = 256;
    end
    
    [Y, X] = size(img);
    % Image quantization
    img = gray2ind(img, levels);
    
    % Set variable sizes
    [~, num_of_distances] = size(distances);
    horizontal_count = zeros(levels, num_of_distances);
    vertical_count = zeros(levels, num_of_distances);
    
    % For each row
    for r = 1:Y
        % For each column
        for c = 1:X
            % For each distance
            for d = 1:num_of_distances
                D = distances(d);
                value = img(r,c); % Get the value
                % Increment the resp. counter, if pixels equivalent
                if(r + D <= Y && img(r + D, c) == value)
                    horizontal_count(value+1, d) = horizontal_count(value+1, d) + 1;
                end
                if(c + D <= X && img(r, c + D) == value)
                    vertical_count(value+1, d) = vertical_count(value+1, d) + 1;
                end
            end
        end
    end
end


%{
** References
* https://in.mathworks.com/matlabcentral/answers/21012-default-parameter-if-the-user-input-is-empty

%}

