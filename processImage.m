function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
image = imread('images/1.jpg');
img = imresize(image,[400 NaN]); %Resize the image (as it is too big)

%Execute getPlate with the image
plate = getPlate(img); 

%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
[grayCrop,coor] = getCroppedPlate(binaryImage, plate);
colorCrop = imcrop(img,coor); 

%Execute rotImage with the cropped image
img = rotImage(grayCrop);
imshow(img);

%Execute getAllLetters with the rotated image
[a,b,c,d,e,f,gray,value,xcoorletters] = getAllLettersY(img);

%Get the position of the stripes in the license plate
[pos1, pos2] = getStripes(img, gray,value, xcoorletters);

%Get the characters of every letter/number in the license plate
[a,b,c,d,e,f] = getPlateChars(a,b,c,d,e,f,gray);

%Get the license plate string
licensePlate = createLicensePlate(a,b,c,d,e,f,pos1,pos2);

display(licensePlate);
end
