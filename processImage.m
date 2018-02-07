image = imread('images/10.JPG');
%Resize the image (as it is too big)
img = imresize(image,[400 NaN]);
[colorPlate,binaryPlate] = getPlate(img);
colorRot = rotateImg(colorPlate,binaryPlate);
figure;
imshow(colorRot)