function letter = checkNumber(binaryIm,originalLetter,possibilities,checker)
%checker=1->check size, checker=2->check perimeter, checker=3->check both
%checker=4->gravity, checker=5->check size*gravity

%chars to check
chars = getNumProblems(possibilities);
%perimeter results
diffArray = zeros(length(chars),1);
perArray = zeros(length(chars),1);
sizeArray = zeros(length(chars),1);
gravityArray = zeros(length(chars),1);
diff2Array = zeros(length(chars),1);

%perimeter to match
dataCheck = measure(binaryIm,label(binaryIm),{'Perimeter','Size','Gravity'});
if length(dataCheck.perimeter) > 1
    [checkPer,index] = max(dataCheck.perimeter);
    checkSize = dataCheck.size(index);
    checkGravity = dataCheck.gravity(index);
else
    checkPer = dataCheck.perimeter(1);
    checkSize = dataCheck.size(1);
    checkGravity = dataCheck.gravity(1);
end

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
    resizedImage = resizeImage(white, binaryIm, grayIm);
    
    %perimeter of this char
    data = measure(resizedImage,label(resizedImage),{'Perimeter','Size','Gravity'});
    if length(data.perimeter) > 1
        [dataPer,index] = max(data.perimeter);
        dataSize = data.size(index);
        dataGravity = data.gravity(index);
    else
        dataPer = data.perimeter(1);
        dataSize = data.size(1);
        dataGravity = data.gravity(1);
    end
    diff = abs(checkPer/checkSize - dataPer/dataSize);
    diffArray(i) = diff;
    sizeD = abs(checkSize - dataSize);
    sizeArray(i) = sizeD;
    perD = abs(checkPer - dataPer);
    perArray(i) = perD;
    gravD = abs(checkGravity - dataGravity);
    gravityArray(i) = gravD;
    diff2 = abs(checkSize*checkGravity - dataSize*dataGravity);
    diff2Array(i) = diff2;
end
% [minD,indexD] = min(diffArray);
% letter = chars(indexD);

index = 0;
if checker == 1
    [mini,index] = min(sizeArray);
elseif checker == 2
    [mini,index] = min(perArray);
elseif checker == 3
    [mini,index] = min(diffArray);
elseif checker == 4
    [mini,index] = min(gravityArray);
elseif checker == 5
    [mini,index] = min(diff2Array);
end

if checker == 6
    [mini1,index1] = min(sizeArray);
    [mini2,index2] = min(perArray);
    [mini3,index3] = min(diffArray);
    [mini4,index4] = min(gravityArray);
    [mini5,index5] = min(diff2Array);
    letters = [originalLetter,chars(index1),chars(index2),chars(index3),chars(index4),chars(index5)];
    letter = mode(letters);
else
    letter = chars(index);
end
end