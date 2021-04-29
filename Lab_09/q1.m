% Extract LBP features from a image

clc;

imgFilePath = "../image_set_2/1.2.01.tiff";
img = imread(imgFilePath);
feat = lbp(img, 1);

figure('Name','LBP features','NumberTitle','off');
bar(feat);
title(sprintf('LBP features for %s', imgFilePath))
xlabel('Feature Bins');
ylabel('Frequency');