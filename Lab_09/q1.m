% Extract LBP features from a image

clc;

imgFilePath = "../image_set_2/1.2.12.tiff";
img = imread(imgFilePath);
feat = lbp(img, 1);

figure('Name',imgFilePath,'NumberTitle','off');
imshow(img);
title(imgFilePath);
figure('Name','LBP features','NumberTitle','off');
bar(feat);
title('LBP features');
xlabel('Feature Bins');
ylabel('Frequency');
