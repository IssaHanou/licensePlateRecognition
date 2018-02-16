function letter = detectChar(image, alphabet, num) 
if num == 1
    %Dutch plates don't have: A,C,E,I,M,O,Q,U,W,Y  
    %0,1,2,3,4,5,6,7,8,9,B,D,F,G,H,J,K,L,N,P,R,S,T,V,X,Z
    chars = [char(48:57),char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
elseif num == 2 
    %Only numbers
    chars = [char(48:57)];
elseif num == 3
    %Only possible dutch letters
    chars = [char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
end

%Get the hog features of this image
features = extractHOGFeatures(image);
%array to store the differences with each letter
diffArray = zeros(1,length(chars));

%How i'd try without for loop
%diffArray(1:length(chars)) = sum(abs(features - alphabet(1:length(chars),:)));
for i=1:length(chars)
    diffArray(i) = sum(abs(features - alphabet(i,:)));
end

%Return the letter with the minimal difference to the current image
[~,index] = min(diffArray);
letter = chars(index);

if letter == '0'
    letter = checkEnclosedPerimeters(image,letter);
end
if letter == '1' || letter == '7'
    letter = checkVertical(image,1);
end
if letter == 'V' || letter == 'J' 
    letter = checkVertical(image,2);
end
end