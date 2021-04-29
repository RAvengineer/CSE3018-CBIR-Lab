% Extract LBP features from a image

clc;
imgFilePath = "../image_set_2/1.2.01.tiff";
img = imread(imgFilePath);
feat = lbp(img, 1);
disp(size(img));
disp(sum(feat));