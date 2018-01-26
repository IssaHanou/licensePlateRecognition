function letter = checkB(image, resultsArray)
%display(resultsArray);
[features,vis] = extractHOGFeatures(image);

chars = getPossibleChars(5);
for i=1:length(chars)
    string = 'lettersNumbers/';
    current = chars(i);
    string = strcat(string,current);
    string = strcat(string,'.PNG');
    im = imread(string);
    gray = rgb2gray(im);
    bin = gray & 1;
    white = bin == 0;
    resizedImage = resizeImage(white, image, gray);
    [charf,charv] = extractHOGFeatures(resizedImage);
    diff = features - charf;
    dist(i) = norm(diff);
end
[~,pos]=min(dist);
letter = chars(pos);
letter = 'B';
end