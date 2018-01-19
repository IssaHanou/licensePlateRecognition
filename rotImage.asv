function rotated = rotImage(croppedImage)
cr = croppedImage;
croppedImage(croppedImage >= 5 & croppedImage <= 100) = 255; % Set every pixel that is sort of black to white
croppedImage(croppedImage < 255 & croppedImage > 5) = 0; % Set every pixel that is now not white to black
[rows, columns] = find(croppedImage); % Get all the rows and columns
row1 = min(rows);
row2 = max(rows);
col1 = min(columns);
col2 = max(columns);
c = cr(row1:row2, col1:col2); % Crop the image
b = c&1; % Get a binary image
struct = regionprops(b , 'Orientation', 'BoundingBox'); 
angle = struct.Orientation; % Get the angle of the license plate
if angle ~= 90 % If the plate is already horizontal, don't rotate
    rotated = imrotate(c,angle*-1,'bilinear'); 
else
    rotated = c;
end
end