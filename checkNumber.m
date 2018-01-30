function letter = checkNumber(binaryIm,possibilities)
%chars to check
chars = getNumProblems(possibilities);
%perimeter results
diffArray = zeros(length(chars),1);
perArray = zeros(length(chars),1);
sizeArray = zeros(length(chars),1);

%perimeter to match
dataCheck = measure(binaryIm,label(binaryIm),{'Perimeter','Size'});
if length(dataCheck.perimeter) > 1
    [checkPer,index] = max(dataCheck.perimeter);
    checkSize = dataCheck.size(index);
else
    checkPer = dataCheck.perimeter(1);
    checkSize = dataCheck.size(1);
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
    data = measure(resizedImage,label(resizedImage),{'Perimeter','Size'});
    if length(data.perimeter) > 1
        [dataPer,index] = max(data.perimeter);
        dataSize = data.size(index);
    else
        dataPer = data.perimeter(1);
        dataSize = data.size(1);
    end
    diff = abs(checkPer/checkSize - dataPer/dataSize);
    diffArray(i) = diff;
    sizeD = abs(checkSize - dataSize);
    sizeArray(i) = sizeD;
    perD = abs(checkPer - dataPer);
    perArray(i) = perD;
end
[minP,index] = min(sizeArray);
letter = chars(index);
end