function license = createLicensePlate(img1,img2,img3,img4,img5,img6,pos1,pos2,alphabet,numAlphabet,letAlphabet,width,height)
letters = zeros(6,1);

%For each image, detect the char
letters(1) = detectChar(img1, alphabet, width, height, 1);
letters(2) = detectChar(img2, alphabet, width, height, 1);
letters(3) = detectChar(img3, alphabet, width, height, 1);
letters(4) = detectChar(img4, alphabet, width, height, 1);
letters(5) = detectChar(img5, alphabet, width, height, 1);
letters(6) = detectChar(img6, alphabet, width, height, 1);
%Construct the plate from the letters and pos, with respect to numbers and
%letters ordering
license = constructLicenseNumLetOrdered(img1,img2,img3,img4,img5,img6,pos1,pos2,letters,numAlphabet,letAlphabet,width,height);
end