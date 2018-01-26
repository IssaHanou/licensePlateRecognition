function [croppedImage, coordinates] = getCroppedPlate(binaryImage, plate)
%Get positions for bounding boxes
struct = regionprops(binaryImage , 'Area', 'BoundingBox'); 
[x maxArea] = max([struct.Area]); %Get the biggest area

%Crop to the part of the biggest area (thus the license plate)
croppedImage = imcrop(plate,struct(maxArea).BoundingBox); 
coordinates = struct(maxArea).BoundingBox;
end