img = imread('images/5.JPG');
grayImage = rgb2gray(img);
X = adjustedImage2(img);
% A = cropToPlate(img,X);

B = borderAroundChar(X);
imshow(B)