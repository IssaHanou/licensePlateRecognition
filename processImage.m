function processImage
img = imread('images/4.JPG');
plate = getPlate(img);
[labelImage,grayIm,thresIm,labelNums] = getEdges(plate);
letterImage = getLetters(labelImage,grayIm,thresIm);
display(letterImage);
end 
