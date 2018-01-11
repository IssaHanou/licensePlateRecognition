img = imread('images/1.JPG');
A = cropToPlate(img);
B = adjustedImage(img);
imshow(A)
figure;
imshow(B)
%C = imfuse(A,B)