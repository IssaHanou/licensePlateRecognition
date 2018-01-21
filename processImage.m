function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
img = imread('images/1.jpg'); 
%Execute getPlate with the image
plate = getPlate(img); 

%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
croppedImage = getCroppedPlate(binaryImage, plate);
figure;
imshow(croppedImage)

%Execute rotImage with the cropped image
img = rotImage(croppedImage);
imshow(img)
%Execute getAllLetters with the rotated image
[a,b,c,d,e,f] = getAllLetters(img);
figure;
imshow(a)
figure;
imshow(b)
figure;
imshow(c)
figure;
imshow(d)
figure;
imshow(e)
figure;
imshow(f)
end
