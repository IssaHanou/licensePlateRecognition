function colorRot = rotateImg(colorPlate, binaryPlate)
struct = regionprops(binaryPlate , 'Orientation', 'BoundingBox'); 
angle = struct.Orientation; % Get the angle of the license plate
if angle ~= 90 % If the plate is already horizontal, don't rotate
    colorRot = imrotate(colorPlate,angle*-1,'bilinear');
else
    colorRot = colorPlate;
end
end