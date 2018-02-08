function onlyPlate = cropToPlate(colorRot, angle)
[height,width,~] = size(colorRot);
alpha = abs(angle); %The angle with which the image is rotated
AC = sin(alpha*pi/180)*height; %Calculate the distance of the rotated image (black triangles)
BD = sin(alpha*pi/180)*width;
%Set coordinates
x = AC; %x location of left most corner
y = BD; %y position of left most corner
w = width - 2*AC; %width of the image to be
h = height - 2*BD; %height of the image to be
onlyPlate = imcrop(colorRot,[x y w h]); %Crop to the plate
end