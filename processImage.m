function processImage
% run('GUI/dipstart.m');
% dipimage;

img = imread('images/1.JPG'); %Read the input image
plate = getPlate(img); %Execute getPlate with the image
[labelImage,grayImage,binaryImage] = getEdges(plate); %Execute getEdges with the image from getPlate
croppedImage = getCroppedPlate(binaryImage, plate);
img = rotImage(croppedImage);
imshow(img)
% figure;
% imhist(img)
img(img > 85) = 0; % Value differs per image:
                    %1: 60-100
                    %2: 85
                    %3: 100
                    %4: 75-120
                    %5: 110-130
                    %6: 140-160
                    %7: 65-100
img(img > 0) = 255;
b = img&1;
st = regionprops(b, 'Area', 'BoundingBox'); 
array = [st.BoundingBox]; %Get an array of all bounding boxes
figure;
imshow(b)
hold on;
for n=1:4:length(array) %Go through the array, but skip 4 as each 4 numbers are the corners of the bounding box
    if(array(n+3) > 5)
        if((array(n+3)/array(n+2)) >= 1.3 && (array(n+3)/array(n+2))<=3)
            %rectangle('Position', [array(n) array(n+1) array(n+2) array(n+3)], 'EdgeColor', 'r' ); %Put a rectangle on the place of the bounding box
            
            a = imcrop(img, [array(n) array(n+1) array(n+2) array(n+3)]);
            figure;
            imshow(a)
        end
    end
end

% [a,b,c] = getEdges(img);
% letters = getLetters(a,b,c);
% labelLetters = label(letters);
%for n=0 : length(labelLetters)
%labelLetters = labelLetters == 12;
% display(labelLetters)
%end



% struct = regionprops(croppedImage , 'Area', 'BoundingBox'); 
% [x maxArea] = max([struct.Area]);
% I = imcrop(plate,struct(maxArea).BoundingBox);
% imshow(I)
% st = regionprops(letters, 'Area', 'BoundingBox'); 
% array = [st.BoundingBox]; %Get an array of all bounding boxes
% display(letters);
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
