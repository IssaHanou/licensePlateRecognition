function letterArray = getPlateChars(img1,img2,img3,img4,img5,img6,gray)
%If no picture was formed for an image, it's value is -1. Else detect its
%letter. Add it to the array
letterArray = [];
if img1 ~= -1
    img1 = toBinary(img1, gray);
    letterArray(end+1) = detectLetter(img1);
else 
    letterArray(end+1) = -1;
end

if img2 ~= -1
    img2 = toBinary(img2, gray);
    letterArray(end+1) = detectLetter(img2);
else 
    letterArray(end+1) = -1;
end 

if img3 ~= -1
    img3 = toBinary(img3, gray);
    letterArray(end+1) = detectLetter(img3);
else 
    letterArray(end+1) = -1;
end

if img4 ~= -1
    img4 = toBinary(img4, gray);
    letterArray(end+1) = detectLetter(img4);
end
if img5 ~= -1
    img5 = toBinary(img5, gray);
    letterArray(end+1) = detectLetter(img5);
else 
    letterArray(end+1) = -1;
end

if img6 ~= -1
    img6 = toBinary(img6, gray);
    letterArray(end+1) = detectLetter(img6);
else 
    letterArray(end+1) = -1;
end
end