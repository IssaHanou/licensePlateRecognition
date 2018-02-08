function [plateString, plateIm] = processImage(image)
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
% figure
% imshow(plateIm);
plateString = 'AA-BB-33';


%Get the average height and width from a letter picture
width = 50;
height = 100;
%Get the hog features for all chars: m x n matrix: 
%m = 36: first all numbers 0-9 then all letters A-Z
%n = 1980: the length of the hog features array
alphabet = getAlphabet(width,height);
letter = detectLetter(img,alphabet,width,heigth);

end

%ideas: 
%1)compute all images for alphabet once
%2)not max(area) but > thres - getPlate for two license plates
%3)boundingboxes, when number isn't > thres - stop, if higher > 6 foreign
%4)FIRST LETTERS: B, F, G, H, J, K, L, N, P, R, S, T, V, X en Z.
