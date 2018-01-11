function processImage
img = imread('images/1.JPG');
plate = getPlate(img);
figure
imshow(plate);
[textRegions,nums] = getEdges(plate);
figure
imshow(textRegions);
end 
