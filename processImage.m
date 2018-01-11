function processImage
img = imread('images/4.JPG');
plate = getPlate(img);
[labelImage,original,labelNums] = getEdges(plate);
end 
