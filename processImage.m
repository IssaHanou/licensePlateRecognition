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
licensePlateImage = img;
%imshow(img);

%Only continue if there is a plate in the image
[y,x] = size(img);
if x < 100 
    licensePlateString = '';
    return
end

%Execute getAllLetters with the rotated image
[img1,img2,img3,img4,img5,img6,gray,pos1,pos2] = getAllLettersY(img);
gray = gray + 10; %Threshold to be surer to get the right letters.
%display(pos1);
%display(pos2);

%If the stripe positions are not in the right place, don't return
if ~and(pos1==3,pos2==7) &&~and(pos1==3,pos2==6) && ~and(pos1==2,pos2==6)
    licensePlateString = '';
    return
end

%Get the characters of every letter/number in the license plate
letterArray = getPlateChars(img1,img2,img3,img4,img5,img6,gray);

%Get the license plate string
licensePlate = createLicensePlate(letterArray,pos1,pos2);
licensePlateString = checkLicensePlate(licensePlate, pos1, pos2);

%If there are more than 2 of the same character (except for -) return
%nothing
checkTriples = erase(licensePlateString,'-');
% if length(unique(checkTriples)) < 5
%     licensePlateString = '';
% end
licensePlateString = noNumbers(licensePlateString,pos1,pos2);

end
