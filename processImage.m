function [plateString, plateIm] = processImage(image, sizes, alphabet)
%For debugging purposes
% image = imread('images/4.JPG');
% height = 100;
% width = 50;
% sizes = [height, width];
% alphabet = getAlphabet(width,height,1);

%Resize the image (as it is too big)
img = imresize(image,[400 NaN]);

%Get the plate out of the image
[colorPlate,binaryPlate] = getPlate(img);
%If no plate was found, return zeroes.
if colorPlate == 0
    plateIm = -1;
    plateString = '';
    return
end

%Rotate the plate to get it horizontal
[colorRot,angle] = rotateImg(colorPlate,binaryPlate);

%Crop the plate after rotation, depending on angle of rotation
plateIm = cropToPlate(colorRot, angle);

%If no image was made, return nothing
if isempty(plateIm)
    plateString = '';
    plateIm = -1;
    return
end

%Crop to get all letters of the plate and construct the license string
license = getLetters(plateIm, sizes, alphabet);
if license == -1
    plateString = '';
    plateIm = -1;
    return
end

plateString = license;
display(plateString);
end