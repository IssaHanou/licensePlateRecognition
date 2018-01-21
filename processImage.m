function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
image = imread('images/british.jpg');
img = imresize(image,[400 NaN]); %Resize the image (as it is too big)
%Execute getPlate with the image
plate = getPlate(img); 
%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
[croppedImage,coor] = getCroppedPlate(binaryImage, plate);
imgCropped = imcrop(img,coor); 
[x y] = max(imhist(imgCropped));
%Execute rotImage with the cropped image
img = rotImage(croppedImage);
imshow(img)
%Execute getAllLetters with the rotated image
if y < 250
    [a,b,c,d,e,f] = getAllLettersY(img);
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
else
    [a,b,c,d,e,f,g] = getAllLettersW(img);
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
    figure;
    imshow(g)
end
end
