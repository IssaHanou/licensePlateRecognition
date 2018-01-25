function letter = detectLetter(image)
%Array keeping al characters to check against.
charArray = getPossibleChars(4);

%Array to store the result of every character
resultsArray = zeros(length(charArray),1);

for i=1:length(charArray)
    %Create file name string
    string = 'lettersNumbers/';
    current = charArray(i);
    string = strcat(string,current);
    string = strcat(string,'.PNG');
    
    %Read in the image and convert it to binary image, with white character 
    im = imread(string);
    gray = rgb2gray(im);
    bin = gray & 1;
    white = bin == 0;
    
    %Resize the image to the same size as the image found in the plate
    resizedImage = resizeImage(white, image, gray);
    diff = double(image) + double(resizedImage);
    
    %Store the difference in the array at the position of this character
    [hist, bin] = diphist(diff, [1, 250], 250);
    resultsArray(i) = hist(1);
end    
[minChar,index] = min(resultsArray);
letter = charArray(index);

if letter == 'B'
    letter = checkB(image, resultsArray);
end
end



