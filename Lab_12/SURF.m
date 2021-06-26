clf
% Extract SURF Features
%% Select Scene image
[scene_name, file_path] = uigetfile('*.*', 'Select the scene image');
scene_img_path = sprintf("%s%s", file_path, scene_name);
if scene_name
    scene_img = im2gray(imread(scene_img_path));
else
    disp('No scene image selected!');
    return
end
% Extract SURF features for scene image
points = detectSURFFeatures(scene_img);
subplot(1, 2, 1);
imshow(scene_img); hold on;
title('Scene Image');
% Extracting top 100 points
plot(points.selectStrongest(100));

%% Select Target image
% Either pick a new image or rotate the scene image
%% For rotating the scene image, uncomment the line below
% target_img = imresize(imrotate(scene_img, -20), 1.2);
%% For picking the a new target image
[target_name, file_path] = uigetfile('*.*', 'Select the target image');
target_path = sprintf("%s%s", file_path, target_name);
if target_name
    target_img = im2gray(imread(target_path));
else
    disp('No scene image selected!');
    return
end
% Extract SURF features for target image
points2 = detectSURFFeatures(target_img);
subplot(1, 2, 2);
imshow(target_img); hold on;
title('Target Image');
% Extracting top 300 points
plot(points2.selectStrongest(300));

%% Matching images
% Extracting the features
[f1,vpts1] = extractFeatures(scene_img, points1);
[f2,vpts2] = extractFeatures(target_img, points2);

% Retrieving the locations of matched points
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

% Displaying the matching points
figure; ax = axes;
showMatchedFeatures(scene_img, target_img, matchedPoints1, matchedPoints2, 'montage','Parent',ax);
title(ax, 'Candidate point matches');
legend(ax, 'Matched points 1','Matched points 2');
