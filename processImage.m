function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
img = imread('images/1.JPG'); 

%Execute getPlate with the image
plate = getPlate(img); 

%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
croppedImage = getCroppedPlate(binaryImage, plate);

%Execute rotImage with the cropped image
img = rotImage(croppedImage);

%Execute getAllLetters with the rotated image
[a,b,c,d,e,f] = getAllLetters(img);
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
