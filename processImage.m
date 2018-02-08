function [plateString, plateIm] = processImage(image)
%Resize the image (as it is too big)
img = imresize(image,[400 NaN]);

%Get the plate out of the image
[colorPlate,binaryPlate] = getPlate(img);

%Rotate the plate to get it horizontal
[colorRot,angle] = rotateImg(colorPlate,binaryPlate);

%Crop the plate after rotation, depending on angle of rotation
plateIm = cropToPlate(colorRot, angle);
figure;
imshow(colorPlate)
plateString = 'AA-BB-33';
end