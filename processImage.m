function processImage
img = imread('images/5.JPG'); %Read the input image
plate = getPlate(img); %Execute getPlate with the image
[labelImage,grayImage,binaryImage] = getEdges(plate); %Execute getEdges with the image from getPlate
%Get where the bounding boxes need to be (Around each label)
struct = regionprops(binaryImage , 'Area', 'BoundingBox'); 
[x maxArea] = max([struct.Area]); %Get the biggest area
croppedImage = imcrop(plate,struct(maxArea).BoundingBox);  %Crop to the part of the biggest area (thus the license plate)


imshow(croppedImage)
% array = [st.BoundingBox]; %Get an array of all bounding boxes
% imshow(labelImage);
% hold on;
% for n=1:4:length(array) %Go through the array, but skip 4 as each 4 numbers are the corners of the bounding box
%     if(array(n+3) > 2)
%         rectangle('Position', [array(n) array(n+1) array(n+2) array(n+3)], 'EdgeColor', 'r' ); %Put a rectangle on the place of the bounding box
%     end
% end
% hold off;
% im2 = imfill(labelImage);
% st2 = regionprops( im2, 'Area', 'BoundingBox' );
% [a b] = max([st2.Area]);
%figure;
%imshow()
end
