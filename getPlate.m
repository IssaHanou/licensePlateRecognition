function plate = getPlate(image)
grayIm = rgb2gray(image); %Create a grayscale image
%**********************************
%Calculate threshold value of the grayscale image
[~, threshold] = edge(grayIm, 'sobel');

%Create a binary mask (binary image with only the edges being 1)
fudgeFactor = .5;
mask = edge(grayIm,'sobel', threshold * fudgeFactor); 

%Creates a linear structuring element that is symmetric with respect to the 
%  neighborhood center. 90 specifies the angle (in degrees) of the line as 
%  measured in a counterclockwise direction from the horizontal axis. 
%  2 is approximately the distance between the centers of the structuring 
%  element members at opposite ends of the line.
se90 = strel('line', 2, 90); 
se0 = strel('line', 2, 0);

%Create a dilated image from the binary edge image
dilatedIm = imdilate(mask, [se90 se0]);

%Suppress light structures connected to image border
noBorders = imclearborder(dilatedIm, 4);

%Fill the holes in the middle of the image
filledHoles = imfill(noBorders, 'holes'); 

%Suppress light structures connected to image border again
noBorders = imclearborder(filledHoles, 4);

%Creates a diamond-shaped structuring element, 
%  where 1 is the distance from the structuring element origin to the points of the diamond.
seD = strel('diamond',1); 

%Erode the image
erodedFirst = imerode(noBorders,seD);

%Extracts all connected components (objects) from the binary image BW,
%  where the area of the objects is in range 1
%  (thus, gets a binary image of a filled license plate)
filledPlate = bwareafilt(erodedFirst,1);

%Multiply the grayscale image with the segmented image to get visible license plate
plate = immultiply(filledPlate,grayIm); 

end
