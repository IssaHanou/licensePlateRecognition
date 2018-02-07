function [colorPlate, binaryPlate] = getPlate(img)

%Set threshold values
sThresh = [0.4 1];      % (Only image 2 does not work with these, as it makes 2 parts of the plate)
vThresh = [0.1 1];

%Set to HSV
hsv = rgb2hsv(img);
hue = round(hsv(:,:,1)*360);
sat = hsv(:,:,2);
val = hsv(:,:,3);

%Use the theshold values
thresh = (sat>=sThresh(1))&(sat<=sThresh(2))&(val>=vThresh(1))&(val<=vThresh(2));

%Keep the yellow parts
yellow = ((hue>30)&(hue<=70))&thresh;

%Get the biggest area
st = regionprops(yellow, 'Area', 'BoundingBox'); 
[~,n] = max( [st.Area] );

%Get the coordinates of that area
array = [st.BoundingBox];
begin = n + (3*(n-1));
rect = [array(begin) array(begin+1) array(begin+2) array(begin+3)];

%Crop the image to the plate
colorPlate = imcrop(img,rect);
binaryPlate = imcrop(yellow,rect);
end