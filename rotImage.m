function grayRot = rotImage(grayCrop)
[rows, columns] = find(grayCrop);
row1 = min(rows);
row2 = max(rows);
col1 = min(columns);
col2 = max(columns);
c = grayCrop(row1:row2, col1:col2); % Crop the image
b = c&1; % Get a binary image
struct = regionprops(b , 'Orientation', 'BoundingBox'); 
angle = struct.Orientation; % Get the angle of the license plate
if angle ~= 90 % If the plate is already horizontal, don't rotate
    grayRot = imrotate(c,angle*-1,'bilinear'); 
else
    grayRot = c;
end
end