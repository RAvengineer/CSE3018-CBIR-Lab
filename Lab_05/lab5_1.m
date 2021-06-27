clc;
img = imread('../image_set_1/img0.jpg');
res = getCCV(img).';
disp(res);
fprintf("Total number of pixels: %d\n", sum(sum(res)));