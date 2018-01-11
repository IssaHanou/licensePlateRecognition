image = imread('images/6.JPG');
I=image;
f=imresize(f,[400 NaN]);                   %%image loading unit
I=rgb2gray(f); %Grayscale image
g=medfilt2(g,[3 3]);
%**********************************
[~, threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);
BWdfill = imfill(BWsdil, 'holes');
BWnobord = imclearborder(BWdfill, 4);
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
X = immultiply(BWfinal,I);
imshow(X)
% BWoutline = bwperim(BWfinal);
% Segout = I; 
% Segout(BWoutline) = 255; 
% figure, imshow(Segout), title('outlined original image');