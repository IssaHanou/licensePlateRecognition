function X = adjustedImage2(image)
f=image;
f=imresize(f,[400 NaN]); %Resize the image
I=rgb2gray(f); %Grayscale image
%**********************************
[~, threshold] = edge(I, 'sobel'); %Calculate threshold value
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor); %Create a binary mask
se90 = strel('line', 3, 90); 
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]); %Dilated image
BWdfill = imfill(BWsdil, 'holes'); %Fill the holes
BWnobord = imclearborder(BWdfill, 4); %Clear parts connected to border
seD = strel('diamond',1); %Make it more natural
BWfinal = imerode(BWnobord,seD); %Eroded...
BWfinal = imerode(BWfinal,seD); %...twice
BWfilt = bwareafilt(BWfinal,1); %Remove non connecting components
X = immultiply(BWfilt,I); %Multiply the grayscale image with the segmented image
imshow(X)
% BWoutline = bwperim(BWfinal);
% Segout = I; 
% Segout(BWoutline) = 255; 
% figure, imshow(Segout), title('outlined original image');