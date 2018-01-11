function processImage
img = imread('images/10.JPG');
plate = getPlate(img);
imshow(plate);
end 
