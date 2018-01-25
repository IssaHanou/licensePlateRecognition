function [licensePlateString, licensePlateImage] = processImage(image)
%image = imread('images/8.jpg');
%Resize the image (as it is too big)
img = imresize(image,[400 NaN]); 

%Execute getPlate with the image
plate = getPlate(img); 

%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
[grayCrop,coor] = getCroppedPlate(binaryImage, plate);
colorCrop = imcrop(img,coor); 

%Execute rotImage with the cropped image
img = rotImage(grayCrop);
%Only continue if there is a plate in the image
blackpart = img < 150;
if sum(sum(blackpart)) < 8000
    licensePlateImage = '';
    licensePlateString = '';
    return;
else 
    licensePlateImage = img;
end
%Execute getAllLetters with the rotated image
[img1,img2,img3,img4,img5,img6,gray,pos1,pos2] = getAllLettersY(img);
if ~and(pos1==3,pos2==7) && ~and(pos1==3,pos2==6) && ~and(pos1==2,pos2==6)
    licensePlateImage = '';
    licensePlateString = '';
    return;
end
%Get the position of the stripes in the license plate
%[pos1, pos2] = getStripes(img, gray, value, xcoorletters);
gray = gray + 10; %Threshold to be surer to get the right letters.

%Get the characters of every letter/number in the license plate
letterArray = getPlateChars(img1,img2,img3,img4,img5,img6,gray);

%Get the license plate string
licensePlateString = createLicensePlate(letterArray,pos1,pos2);

%If there are not two stripes in a license plate don't return one
if strfind(licensePlateString,'-') <= 1
    licensePlateString = '';
%If there are more than 2 of the same character (except for -) return
%nothing
elseif length(unique(licensePlateString)) < 5
    licensePlateString = '';
end
end
