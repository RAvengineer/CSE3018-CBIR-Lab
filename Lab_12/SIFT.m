clf
% Extract SIFT Features

I = imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_2/1.1.12.tiff');
image(I);
I = single(im2gray(I));
% compute the SIFT frames (keypoints) and descriptors
[f,d] = vl_sift(I);
perm = randperm(size(f,2));
sel = perm(1:50);
h1 = vl_plotframe(f(:,sel));
h2 = vl_plotframe(f(:,sel));
set(h1,'color','k','linewidth',3);
set(h2,'color','y','linewidth',2);
h3 = vl_plotsiftdescriptor(d(:,sel),f(:,sel));
set(h3,'color','g');

%% Image Matching
Ia= imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_2/1.1.12.tiff');
figure; image(Ia);
[r, c]=size(Ia);
Ib=imread('/home/rahul/VITCC/WIN_20-21/CSE3018/Lab/image_set_2/1.3.12.tiff');
Ib = imresize(Ib, [r c]);
figure; image(Ib);
Ia = single(im2gray(Ia));
Ib = single(im2gray(Ib));
%NOTE: Images have to be the same size
[fa, da] = vl_sift(Ia);
[fb, db] = vl_sift(Ib);
[matches, scores] = vl_ubcmatch(da, db);

%% Visualization
m1= fa (1:2,matches(1,:));
m2=fb(1:2,matches(2,:));
m2(1,:)= m2(1,:)+size(Ia,2)*ones(1,size(m2,2));
X=[m1(1,:);m2(1,:)];
Y=[m1(2,:);m2(2,:)];
c=[Ia Ib];
imshow(c,[]);
hold on;

% Determine number of lines depending on dimensions of X and Y
line(X,Y);

