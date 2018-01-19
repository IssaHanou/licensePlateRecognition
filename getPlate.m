function plate = getPlate(image)
image = imresize(image,[400 NaN]); %Resize the image
grayIm = rgb2gray(image); %Grayscale image
%**********************************
[~, threshold] = edge(grayIm, 'sobel'); %Calculate threshold value
fudgeFactor = .5;
mask = edge(grayIm,'sobel', threshold * fudgeFactor); %Create a binary mask
se90 = strel('line', 2, 90); 
se0 = strel('line', 2, 0);
dilatedIm = imdilate(mask, [se90 se0]); %Dilated image
noBorders = imclearborder(dilatedIm, 4);
filledHoles = imfill(noBorders, 'holes'); %Fill the holes in the middle of the image
noBorders = imclearborder(filledHoles, 4); %Clear parts connected to border
seD = strel('diamond',1);
erodedFirst = imerode(noBorders,seD);
filledPlate = bwareafilt(erodedFirst,1);
%Multiply the grayscale image with the segmented image to get visible license plate
plate = immultiply(filledPlate,grayIm); 
end
