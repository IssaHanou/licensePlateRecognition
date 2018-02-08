%function [plateString, plateIm] = processImage(image)
image = imread('images/7.JPG');
%Resize the image (as it is too big)
img = imresize(image,[400 NaN]);

%Get the plate out of the image
[colorPlate,binaryPlate] = getPlate(img);
figure;
imshow(colorPlate);
title('getPlate');
%Rotate the plate to get it horizontal
[colorRot,angle] = rotateImg(colorPlate,binaryPlate);
figure;
imshow(colorRot);
title('after rotation');

%Crop the plate after rotation, depending on angle of rotation
plateIm = cropToPlate(colorRot, angle);
figure;
imshow(plateIm);
title('after cropping');
plateString = 'AA-BB-33';
%end