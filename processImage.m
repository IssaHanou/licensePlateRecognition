function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
image = imread('images/2.jpg');
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

%Execute getAllLetters with the rotated image
[a,b,c,d,e,f,gray] = getAllLettersY(img);
imshow(img);
licensePlate = getLicensePlate(a,b,c,d,e,f,gray)
end
