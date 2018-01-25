function resizedImage = resizeImage(imageToResize, imageRightSize, gray)
z=2;
b = gray & 1; %Make binary image
st = regionprops(b, 'Area', 'BoundingBox'); 
array = [st.BoundingBox]; %Get an array of all bounding boxes
a = imcrop(imageToResize, [array(1)-z array(1)-z array(3)+(2*z) array(4)+(2*z)]);

[y,x] = size(imageRightSize);  %// Find row and column locations that are non-zero
resizedImage = imresize(a,[y,x]); %resize image to the dimensions of the other image
end