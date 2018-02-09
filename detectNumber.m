function letter = detectNumber(img, alphabet, width, height) 
%Array with all possible chars for dutch plates
%0,1,2,3,4,5,6,7,8,9
chars = [char(48:57)];

%Resize the image to the standard sizes
image = imresize(img, [height,width]);

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
[minimum,index] = min(diffArray);
letter = chars(index);
end