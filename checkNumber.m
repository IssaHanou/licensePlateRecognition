function letter = checkNumber(binaryIm)
%checker=1->check size, checker=2->check perimeter, checker=3->check both
%checker=4->gravity, checker=5->check size*gravity

%chars to check
chars = [char(66),char(80),char(82)];
%perimeter results
perArray = zeros(length(chars),1);

%perimeter to match
dataCheck = measure(binaryIm,label(binaryIm),{'Perimeter','Size','Gravity'});
if length(dataCheck.perimeter) > 1
    [checkPer,index] = max(dataCheck.perimeter);
else
    checkPer = dataCheck.perimeter(1);
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
    else
        dataPer = data.perimeter(1);
    end
    perD = abs(checkPer - dataPer);
    perArray(i) = perD;
end

[mini,index] = min(perArray);
letter = chars(index);
end