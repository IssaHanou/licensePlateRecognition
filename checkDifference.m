function letter = checkDifference(img)
%COMPUTE THIS STATIC FOR ALL LETTERS
chars = [];
diffArray = zeros(length(chars),1);


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
    
data = measure(resizedImage,label(resizedImage),{'Perimeter','Size','Gravity'});
[dataPer,index] = max(data.perimeter);
dataSize = data.size(index);
diff = abs(checkPer/checkSize - dataPer/dataSize);
diffArray(i) = diff;
end