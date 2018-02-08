function license = createLicensePlate(img1,img2,img3,img4,img5,img6,pos1,pos2)
letters = zeros(6,1);
%To make sure all images are compared with same sizes
%[height,width] = size(img1);
height = 100;
width = 50;

%Get the hog features for each possible plate char
alphabet = getAlphabet(width,height);

%For each image, detect the char
letters(1) = detectLetter(img1, alphabet, width, height);
letters(2) = detectLetter(img2, alphabet, width, height);
letters(3) = detectLetter(img3, alphabet, width, height);
letters(4) = detectLetter(img4, alphabet, width, height);
letters(5) = detectLetter(img5, alphabet, width, height);
letters(6) = detectLetter(img6, alphabet, width, height);

%Construct the plate from the letters and pos
if and(pos1==3,pos2==7)
    license = [letters(1),letters(2),'-',letters(3),letters(4),letters(5),'-',letters(6)];
elseif and(pos1==3,pos2==6)
    license = [letters(1),letters(2),'-',letters(3),letters(4),'-',letters(5),letters(6)];
elseif and(pos1==2,pos2==6)
    license = [letters(1),'-',letters(2),letters(3),letters(4),'-',letters(5),letters(6)];
end
end