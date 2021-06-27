%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ColorCoherenceVector
%====================
%
%Color Coherence Vector is a powerful color-based image retrieval 
%Parallel implementation based on this paper : Comparing Images Using Color
%Coherence Vectors (1996) - http://goo.gl/LkWkbi -
%CCV = getCCV(img, numberOfPixels)
%getCCV function takes an image and returns the Color Coherence Vector that
%describe this Image. You can compare images using this vector.
%
%Input:
%img : The Image (3-channel Image)
%
%Optional Input:
%numberOfColors: The number of different colors in the Color Coherence 
%Vector (default = 16 colors).
%
%Output :
%CCV: a (2*numberOfColors) matrix represents your image. 
%[[c1, n1]; [c2, n2]; ... ; [ci, ni]] where i: numberOfColors
%This can be used for matching.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function CCV = getCCV(img, numberOfColors)
    % Set default values for optional parameters
    if ~exist('numberOfColors','var')
        numberOfColors = 16;
    end
    % Initialize the return variable
    CCV = zeros(3,numberOfColors);
    
    % Create a Guassian filter
    Gaus = fspecial('gaussian',[5 5],2);
    img = imfilter(img,Gaus,'same');
    % Convert image to grayscale
    img = im2gray(img);
    
    % Discretize the image
    img = floor((img/(256/numberOfColors)));
    
    % Use 'parallel for' for finding connected components of resp. bins
    parfor i=0:numberOfColors-1
        % Create a binary image for resp. bin
        BW = img==i;
        % Retrieve connected components for 3x3 window
        CC = bwconncomp(BW,8);
        % Extract vector containing component sizes for all detected
        % components
        compsSize = cellfun(@numel,CC.PixelIdxList);
        
        % Choose threshold/tau as the mean of maxsize & minsize of the
        % components detected
        tau = floor(mean([max(compsSize),min(compsSize)]));
        % Find total number of pixels for all the components having size
        % greater than or equal to tau & mark them as coherent pixels
        coherent = sum(compsSize(compsSize>=tau));
        
        % Add the coherent & incoherent pixels for resp. bin in the return
        % variable
        CCV(:,i+1) = [i; coherent; sum(compsSize) - coherent];
    end
end

% References:
% - https://github.com/TarekVito/ColorCoherenceVector
% - https://owlcation.com/stem/Image-Retrieval-Color-Coherence-Vector

