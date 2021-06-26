% Read in original RGB image.
rgbImage = imread('c2_rgb.jpg');

% Extract color channels.
redChannel = rgbImage(:,:,1); % Red channel
greenChannel = rgbImage(:,:,2); % Green channel
blueChannel = rgbImage(:,:,3); % Blue channel

% Display them all.
subplot(2, 3, 2);
imshow(rgbImage);
fontSize = 20;
title('Original RGB Image', 'FontSize', fontSize) 
subplot(2, 3, 4);
imshow(redChannel);
title('Red Channel', 'FontSize', fontSize)
subplot(2, 3, 5);
imshow(greenChannel);
title('Green Channel', 'FontSize', fontSize)
subplot(2, 3, 6);
imshow(blueChannel);
title('Blue Channel', 'FontSize', fontSize)


% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0, 1, 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
% set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'Channels', 'NumberTitle', 'Off')