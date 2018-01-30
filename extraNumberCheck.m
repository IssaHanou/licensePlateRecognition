function numberOut = extraNumberCheck(numberIn, image, grayFactor)
binIm = toBinary(image,grayFactor);
numberOut = numberIn;

if numberIn == '0'
    numberOut = checkNumber(binIm,numberIn,0,1);
elseif numberIn == '1'
    numberOut = checkNumber(binIm,numberIn,1,2);
elseif numberIn == '2'
    numberOut = checkNumber(binIm,numberIn,2,5);
elseif numberIn == '3' 
    numberOut = checkNumber(binIm,numberIn,3,2);
elseif numberIn == '4' 
    numberOut = checkNumber(binIm,numberIn,4,2);
elseif numberIn == '5' 
    numberOut = checkNumber(binIm,numberIn,5,2);
elseif numberIn == '6' 
    numberOut = checkNumber(binIm,numberIn,6,2);
elseif numberIn == '7' 
    numberOut = checkNumber(binIm,numberIn,7,6);
elseif numberIn == '8' 
    numberOut = checkNumber(binIm,numberIn,8,2);
elseif numberIn == '9' 
    numberOut = checkNumber(binIm,numberIn,9,2);
end
end