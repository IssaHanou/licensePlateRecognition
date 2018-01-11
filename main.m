img = imread('images/10.JPG');
grayImage = rgb2gray(img);
X = adjustedImage2(img);
% A = cropToPlate(img,X);
imshow(X)

% measurements = regionprops(X, 'Area', 'BoundingBox');
% allAreas = [measurements.Area]
% % Crop out each word
% for blob = 1 : length(measurements)
% 	% Get the bounding box.
% 	thisBoundingBox = measurements(blob).BoundingBox;
% 	% Crop it out of the original gray scale image.
% 	thisWord = imcrop(grayImage, thisBoundingBox);
% 	imshow(thisWord); % Display it.
% end
% A = cropToPlate(img);
% [B,C] = adjustedImage(img);
% imshow(A)
% figure
% imshow(B)
%C = imfuse(A,B)
% D = C & 0;
% for obj = 1 : length(B)
%     if (B == obj)
%     D = D | B == obj;
% end
% figure
% imshow(D);