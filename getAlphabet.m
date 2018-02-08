function letters = getAlphabet(width,height)
%Dutch plates don't have: A,C,E,I,M,O,Q,U,W,Y  
%0,1,2,3,4,5,6,7,8,9,B,D,F,G,H,J,K,L,N,P,R,S,T,V,X,Z
chars = [char(48:57),char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];

featuresLength = 1980;
letters = zeros(length(chars),featuresLength);
    
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
    image = bin == 0;
    
    %Resize the image to the standard sizes
    image = imresize(image, [height,width]);
    features = extractHOGFeatures(image);
    letters(i,:) = features;
end    