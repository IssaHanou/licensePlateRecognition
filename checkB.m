function letter = checkLetterNumber(image, resultsArray)
%display(resultsArray);
%imshow(image);
array = [];
%b,8,p,s,3
chars = [char(66),char(51),char(80),char(83),char(56)];

%figure
%imshow(image);
for i=1:length(chars)
    %Create file name string
    string = 'lettersNumbers/';
    current = chars(i);
    string = strcat(string,current);
    string = strcat(string,'.PNG');
    
    %Read in the image and convert it to binary image, with white character 
    im = imread(string);
    gray = rgb2gray(im);
    bin = gray & 1;
    white = bin == 0;

    %Resize the image to the same size as the image found in the plate
    resizedImage = resizeImage(white, image, gray);
    diff = abs(double(image) - double(resizedImage));
    
    %figure
    %imshow(diff);
    
    %Store the difference in the array at the position of this character
    [hist, bin] = diphist(diff, [1, 255], 255);
    array(i) = hist(1);
end
display(array);
[minChar,index] = min(array);
letter = chars(index);
end