function plate = getPlate(image)
image=imresize(image,[400 NaN]); %Resize the image
grayIm=rgb2gray(image); %Grayscale image
%**********************************
[~, threshold] = edge(grayIm, 'sobel'); %Calculate threshold value
fudgeFactor = .5;
BWs = edge(grayIm,'sobel', threshold * fudgeFactor); %Create a binary mask
se90 = strel('line', 3, 90); 
se0 = strel('line', 3, 0);
dilatedIm = imdilate(BWs, [se90 se0]); %Dilated image
filledHoles = imfill(dilatedIm, 'holes'); %Fill the holes in the middle of the image
noBorders = imclearborder(filledHoles, 4); %Clear parts connected to border
filledPlate = bwareafilt(noBorders,1);
%Multiply the grayscale image with the segmented image to get visible license plate
plate = immultiply(filledPlate,grayIm); 
end
