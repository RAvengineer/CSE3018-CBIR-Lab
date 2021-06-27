clc;
imgFilePath = '../image_set_1/img0.jpg';
res = getGLCMFeatures(imgFilePath, 64).';
disp(res);