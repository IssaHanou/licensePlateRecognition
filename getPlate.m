function [colorPlate, binaryPlate, colorPlate2, binaryPlate2] = getPlate(img)
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
yellow = ((hue > 13) & (hue<=70)) & thresh;

%Make sure the plate is not split, 'glue' pixels close to each other
se = strel('disk',2);
yellow = imclose(yellow, se);

%Get the biggest area
st = regionprops(yellow, 'Area', 'BoundingBox'); 
%To find two plates
plates = find([st.Area] > 1000);
 
if length(plates) == 1 %If one yellow plate was found
    %Get the coordinates of that area
    array = [st.BoundingBox];
    n = plates(1);
    begin = n + (3*(n-1));
    z = 0;
    rect = [array(begin)+z array(begin+1)+z array(begin+2)+z array(begin+3)+z];
    %Crop the image to the plate
    colorPlate = imcrop(img,rect);
    binaryPlate = imcrop(yellow,rect);
	colorPlate2 = 0;
	binaryPlate2 = 0;
elseif length(plates) == 2 %If two yelow plates were found
	%Get the coordinates of the areas
    array = [st.BoundingBox];
	n = plates(1);
    begin = n + (3*(n-1));
    z = 0;
    rect = [array(begin)+z array(begin+1)+z array(begin+2)+z array(begin+3)+z];
    %Crop the image to the plate
    colorPlate = imcrop(img,rect);
    binaryPlate = imcrop(yellow,rect);
	%Repeat for second plate
	n = plates(2);
    begin = n + (3*(n-1));
    z = 0;
    rect = [array(begin)+z array(begin+1)+z array(begin+2)+z array(begin+3)+z];
    %Crop the image to the plate
    colorPlate2 = imcrop(img,rect);
    binaryPlate2 = imcrop(yellow,rect);
else %There were no plates found
    colorPlate = 0;
    binaryPlate = 0;
	colorPlate2 = 0;
	binaryPlate2 = 0;
end

% [~,n] = max( [st.Area] );
% 
% %If no yellow was found in the picture
% if n == 0 
%     colorPlate = 0;
%     binaryPlate = 0;
% else
%     %Get the coordinates of that area
%     array = [st.BoundingBox];
%     begin = n + (3*(n-1));
%     z = 0;
%     rect = [array(begin)+z array(begin+1)+z array(begin+2)+z array(begin+3)+z];
%     %Crop the image to the plate
%     colorPlate = imcrop(img,rect);
%     binaryPlate = imcrop(yellow,rect);
% end
end