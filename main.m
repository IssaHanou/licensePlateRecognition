img = imread('images/2.JPG');
[B,C] = adjustedImage(img);
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