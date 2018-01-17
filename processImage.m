function processImage
img = imread('images/9.JPG');
plate = getPlate(img);
[labelImage,grayIm,thresIm,labelNums] = getEdges(plate);
letterImage = getLetters(labelImage,grayIm,thresIm);
display(letterImage);
end 
