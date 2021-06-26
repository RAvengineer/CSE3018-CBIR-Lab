% Loading the test image and displaying its content
test_image_1 = imread('./images/test-1.jpg');

% Displaying the test images
imshow(test_image_1);

% Extracting the shape features for the images
test_image_1_stats = getShapeStats(test_image_1);

disp(test_image_1_stats);