clf
% Extract SURF Features
% Modify current figure title
set(gcf, 'Name','SURF keypoints','NumberTitle','off');
%% Select Scene image
[scene_name, file_path] = uigetfile('*.*', 'Select the scene image');
scene_img_path = sprintf("%s%s", file_path, scene_name);
if scene_name
    scene_img = imread(scene_img_path);
    scene_img_gray = im2gray(scene_img);
else
    disp('No scene image selected!');
    return
end
% Extract SURF features for scene image
points = detectSURFFeatures(scene_img_gray);
subplot(1, 2, 1);
imshow(scene_img); hold on;
title(sprintf('Scene Image\n%s', scene_name));
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
    target_img = imread(target_path);
    target_img_gray = im2gray(target_img);
else
    disp('No target image selected!');
    return
end
% Extract SURF features for target image
points2 = detectSURFFeatures(target_img_gray);
subplot(1, 2, 2);
imshow(target_img); hold on;
title(sprintf('Target Image\n%s', target_name));
% Extracting top 300 points
plot(points2.selectStrongest(300));


%% Matching images
% Extracting the features
[f1,vpts1] = extractFeatures(scene_img_gray, points1);
[f2,vpts2] = extractFeatures(target_img_gray, points2);

% Retrieving the locations of matched points
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

% Displaying the matching points
figure('Name','Matched points','NumberTitle','off'); ax = axes;
showMatchedFeatures(scene_img, target_img, matchedPoints1, matchedPoints2, 'montage','Parent',ax);
title(ax, 'Candidate point matches');
legend(ax, 'Matched points 1','Matched points 2');
