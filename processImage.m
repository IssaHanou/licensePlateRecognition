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
[height,width,~] = size(colorCrop);
[grayimg,colorimg,angle] = rotImage(grayCrop,colorCrop);
alpha = abs(angle); %The angle with which the image is rotated
AC = sin(alpha*pi/180)*height; %Calculate the distance of the rotated image (black triangles)
BD = sin(alpha*pi/180)*width;
%Set coordinates
x = AC;
y = BD;
w = width - AC;
h = height - BD;
img = imcrop(colorimg,[x y w h]); %Crop to the plate
licensePlateImage = img;
%imshow(img);

%Only continue if there is a plate in the image
[y,x] = size(img);
if x < 100 
    licensePlateString = '';
    return
end

img = rgb2gray(img);
%Execute getAllLetters with the rotated image
[img1,img2,img3,img4,img5,img6,grayFactor,pos1,pos2] = getAllLettersY(img);
grayFactor = grayFactor + 10; %Threshold to be surer to get the right letters.
% display(pos1);
% display(pos2);

%If the stripe positions are not in the right place, don't return
if ~and(pos1==3,pos2==7) &&~and(pos1==3,pos2==6) && ~and(pos1==2,pos2==6)
    licensePlateString = '';
    return
end

%Get the characters of every letter/number in the license plate
letterArray = getPlateChars(img1,img2,img3,img4,img5,img6,grayFactor);

%Get the license plate string
licensePlate = createLicensePlate(letterArray,pos1,pos2);
[licensePlateString,number1] = checkLicensePlate2(licensePlate, pos1, pos2,img1,img2,img3,img4,img5,img6,grayFactor);
if number1 == 0
    licensePlateString = '';
    return;
end

%If there are more than 2 of the same character (except for -) return
%nothing
licensePlateString = checkTriples(licensePlateString);
licensePlateString = noNumbers(licensePlateString,pos1,pos2);
display(licensePlateString);

end