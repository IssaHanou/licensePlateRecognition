function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
image = imread('images/1.jpg');
img = imresize(image,[400 NaN]); %Resize the image (as it is too big)
%Execute getPlate with the image
plate = getPlate(img); 
%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
[grayCrop,coor] = getCroppedPlate(binaryImage, plate);
colorCrop = imcrop(img,coor); 
% [x y] = max(imhist(imgCropped));
% imhist(imgCropped)
%Execute rotImage with the cropped image
img = rotImage(grayCrop);
imshow(colorCrop)
figure;
imshow(grayCrop)
%Execute getAllLetters with the rotated image
% if y < 250
    [a,b,c,d,e,f] = getAllLettersY(img);
    g = 0;
    figure;
    imshow(a)
    figure;
    imshow(b)
    figure;
    imshow(c)
    figure;
    imshow(d)
    figure;
    imshow(e)
    figure;
    imshow(f)
% else
%     [a,b,c,d,e,f,g] = getAllLettersW(img);
%     figure;
%     imshow(a)
%     figure;
%     imshow(b)
%     figure;
%     imshow(c)
%     figure;
%     imshow(d)
%     figure;
%     imshow(e)
%     figure;
%     imshow(f)
%     figure;
%     imshow(g)
% end
end
