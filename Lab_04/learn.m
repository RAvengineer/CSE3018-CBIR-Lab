img = imread('../Lab_3/images/img1.jpg');
img = rgb2gray(img);
[hc, vc] = acg(img, [1 3]);
