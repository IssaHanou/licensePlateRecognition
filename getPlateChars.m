function letterArray = getPlateChars(img1,img2,img3,img4,img5,img6,grayFactor)
%If no picture was formed for an image, it's value is -1. Else detect its
%letter. Add it to the array
letterArray = [];
if img1 ~= -1
    imgb1 = toBinary(img1, grayFactor);
    letterArray(end+1) = detectLetter(imgb1,4,false);
else 
    letterArray(end+1) = -1;
end

if img2 ~= -1
    imgb2 = toBinary(img2, grayFactor);
    letterArray(end+1) = detectLetter(imgb2,4,false);
else 
    letterArray(end+1) = -1;
end 

if img3 ~= -1
    imgb3 = toBinary(img3, grayFactor);
    letterArray(end+1) = detectLetter(imgb3,4,false);
else 
    letterArray(end+1) = -1;
end

if img4 ~= -1
    imgb4 = toBinary(img4, grayFactor);
    letterArray(end+1) = detectLetter(imgb4,4,false);
else 
    letterArray(end+1) = -1;
end

if img5 ~= -1
    imgb5 = toBinary(img5, grayFactor);
    letterArray(end+1) = detectLetter(imgb5,4,false);
else 
    letterArray(end+1) = -1;
end

if img6 ~= -1
    imgb6 = toBinary(img6, grayFactor);
    letterArray(end+1) = detectLetter(imgb6,4,false);
else 
    letterArray(end+1) = -1;
end
end