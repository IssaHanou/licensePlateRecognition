function [plateString, plateIm] = processImage(image, sizes, alphabet)
%For debuggin purposes
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

%Crop to get all letters of the plate
%[img1, img2, img3, img4, img5, img6, pos1, pos2] = getLetters(plateIm, sizes, alphabet);
license = getLetters(plateIm, sizes, alphabet);
if license == -1
    plateString = '';
    plateIm = -1;
    return
end
%Check if pos are possible stripe positions and if none of the images is
%'0', if everything is good return true, if something is off, return false
% checker = checkGetLetters(img1,img2,img3,img4,img5,img6,pos1,pos2);
% if checker == false
%     plateString = '';
%     plateIm = -1;
%     return
% end
%     
% 
% 
% %%%%%calculate per letter
% license = createLicensePlate(img1,img2,img3,img4,img5,img6,pos1,pos2,alphabet,numAlphabet,letAlphabet,width,height);

plateString = license;
display(plateString);

end

%ideas: 
%1)compute all images for alphabet once
%2)not max(area) but > thres - getPlate for two license plates
%3)boundingboxes, when number isn't > thres - stop, if higher > 6 foreign
%4)FIRST LETTERS: B, F, G, H, J, K, L, N, P, R, S, T, V, X en Z.
