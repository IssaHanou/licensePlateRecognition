function [licensePlateString, licensePlateImage] = processImage(image)
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
blackpart = img < 150;
if sum(sum(blackpart)) < 10000
    licensePlateImage = '';
    licensePlateString = '';
    return;
else 
    licensePlateImage = img;
end
%Execute getAllLetters with the rotated image
[img1,img2,img3,img4,img5,img6,gray,value,xcoorletters] = getAllLettersY(img);


%Get the position of the stripes in the license plate
[pos1, pos2] = getStripes(img, gray, value, xcoorletters);
gray = gray + 10; %Threshold to be surer to get the right letters.

%Get the characters of every letter/number in the license plate
letterArray = getPlateChars(img1,img2,img3,img4,img5,img6,gray);

%Get the license plate string
licensePlateString = createLicensePlate(letterArray,pos1,pos2);

if length(unique(licensePlateString)) < 4
    licensePlateString = '';
end
end
