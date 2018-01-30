function letter = checkLetter(image, possibilities)
[features,vis] = extractHOGFeatures(image);
chars = getPossibleChars(possibilities);
dist = zeros(length(chars),1);

for i=1:length(chars)
    string = 'lettersNumbers/';
    current = chars(i);
    string = strcat(string,current);
    string = strcat(string,'.PNG');
    
    im = imread(string);
    grayIm = rgb2gray(im);
    bin = grayIm & 1;
    white = bin == 0;
    
    resizedImage = resizeImage(white, image, grayIm);
    [charf,charv] = extractHOGFeatures(resizedImage);
    
    diff = features - charf;
    dist(i) = norm(diff);
end
[~,pos]=min(dist);
letter = chars(pos);
end