function letter = check0986(image,letter)
im = imfill(image, 'holes');
dataCheck = measure(im,label(im),{'Perimeter','Gravity'});
checkPer = dataCheck.perimeter;
checkGravY = dataCheck.gravity(2);
checkGravX = dataCheck.gravity(1);

chars = getNumProblems(0);
perArray = zeros(length(chars),1);
gravXArray = zeros(length(chars),1);
gravYArray = zeros(length(chars),1);

for i=1:length(chars)
    %Create file name string
    string = 'lettersNumbers/';
    current = chars(i);
    string = strcat(string,current);
    string = strcat(string,'.PNG');
    
    %Read in the image and convert it to binary image, with white character 
    im = imread(string);
    grayIm = rgb2gray(im);
    bin = grayIm & 1;
    white = bin == 0;
    
    %Resize the image to the same size as the image found in the plate
    resizedImage = resizeImage(white, image, grayIm);
    
    %perimeter of this char
    data = measure(resizedImage,label(resizedImage),{'Perimeter','Gravity'});
    [dataPer,index] = max(data.perimeter);
    dataGravX = data.gravity(1);
    dataGravY = data.gravity(2);

    perArray(i) = dataPer;
    gravXArray(i) = dataGravX;
    gravYArray(i) = dataGravY;
%     perD = abs(checkPer - dataPer);
%     perArray(i) = perD;
%     gravXD = abs(checkGravX - dataGravX);
%     gravXArray(i) = gravXD;
%     gravYD = abs(checkGravY - dataGravY);
%     gravYArray(i) = gravYD;
end
%smallest per = 0
%smalles gravY = 9
%biggest gravY = 6
%biggest gravX = 8
[minP,indexP] = min(perArray);
[minY,indexY] = min(gravYArray);
[minX,indexX] = min(gravXArray);
[maxY,indexYMax] = max(gravYArray);

if indexYMax == 4
    letter = '6';
elseif indexY == 2
    letter = '9';
elseif indexX == 3
    letter = '8';
elseif indexP == 1
    letter = '0';
end