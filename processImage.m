function processImage
img = imread('images/2.JPG'); %Read the input image
plate = getPlate(img); %Execute getPlate with the image
[labelImage,grayImage,binaryImage] = getEdges(plate); %Execute getEdges with the image from getPlate
croppedImage = getCroppedPlate(binaryImage, plate);
img = rotImage(croppedImage);
imshow(img)
%[hist, bin] = diphist(img, [1, 250], 250);
% figure;
% imhist(img)
% [x y] = imhist(img);
% count = median(x);
% count2 = mean(y);
% disp(count)
% disp(count2)
% %figure;
% %stem(bin, hist);
% img(img >= 110) = 0;
% img(img > 0) = 255;
% figure;
% imshow(img)
% struct = regionprops(croppedImage , 'Area', 'BoundingBox'); 
% [x maxArea] = max([struct.Area]);
% I = imcrop(plate,struct(maxArea).BoundingBox);
% imshow(I)


% st = regionprops(croppedImage , 'Area', 'BoundingBox'); 
% array = [st.BoundingBox]; %Get an array of all bounding boxes
% imshow(img);
% hold on;
% for n=1:4:length(array) %Go through the array, but skip 4 as each 4 numbers are the corners of the bounding box
%     if(array(n+3) > 2)
%         rectangle('Position', [array(n) array(n+1) array(n+2) array(n+3)], 'EdgeColor', 'r' ); %Put a rectangle on the place of the bounding box
%     end
% end
% hold off;
% im2 = imfill(img);
% st2 = regionprops( im2, 'Area', 'BoundingBox' );
% [a b] = max([st2.Area]);
% figure;
% imshow()
end
