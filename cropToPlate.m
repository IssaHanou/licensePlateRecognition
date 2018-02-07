function onlyPlate = cropToPlate(colorRot, angle)
[height,width,~] = size(colorRot);
alpha = abs(angle); %The angle with which the image is rotated
AC = sin(alpha*pi/180)*height; %Calculate the distance of the rotated image (black triangles)
BD = sin(alpha*pi/180)*width;
%Set coordinates
x = AC;
y = BD;
w = width - 2*AC;
h = height - 2*BD;
onlyPlate = imcrop(colorRot,[x y w h]); %Crop to the plate
end