clf
img=imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_1/img13.jpg');
scene_img=im2gray(img);
points = detectSURFFeatures(scene_img);
subplot(1, 2, 1);
imshow(scene_img); hold on;
title('Scene Image');
%Extracting top 100 points
plot(points.selectStrongest(100));

img2=imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_1/img1.jpg');
target_img=im2gray(img2);
points2 = detectSURFFeatures(target_img);
subplot(1, 2, 2);
imshow(target_img); hold on;
title('Target Image');
%Extracting top 300 points
plot(points2.selectStrongest(300));


%Matching images
I1 = imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_1/img13.jpg');
I1=im2gray(I1);
%I2 = imresize(imrotate(I1,-20),1.2); %rotation of the input image.
I2=imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_1/img1.jpg');
I2=im2gray(I2);

%Finding the SURF features.
points1 = detectSURFFeatures(I1);
points2 = detectSURFFeatures(I2);

%Extracting the features.
[f1,vpts1] = extractFeatures(I1,points1);
[f2,vpts2] = extractFeatures(I2,points2);

%Retrieving the locations of matched points.
indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

%Displaying the matching points.
figure;
showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);
legend('matched points 1','matched points 2');



