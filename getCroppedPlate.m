function croppedImage = getCroppedPlate(binaryImage)
%Get positions for bounding boxes
struct = regionprops(binaryImage , 'Area', 'BoundingBox'); 
[x maxArea] = max([struct.Area]); %Get the biggest area
%Crop to the part of the biggest area (thus the license plate)
croppedImage = imcrop(plate,struct(maxArea).BoundingBox);  
end