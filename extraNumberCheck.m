function numberOut = extraNumberCheck(numberIn, image, grayFactor)
binIm = toBinary(image,grayFactor);
numberOut = numberIn;

if numberIn == '0'
    numberOut = checkNumber(binIm,0);
%     numberOut = skeletonCheck(binIm,0);
elseif numberIn == '1'
    numberOut = checkNumber(binIm,1);
elseif numberIn == '2'
    numberOut = checkNumber(binIm,2);
elseif numberIn == '3' 
    numberOut = checkNumber(binIm,3);
elseif numberIn == '4' 
    numberOut = checkNumber(binIm,4);
elseif numberIn == '5' 
    numberOut = checkNumber(binIm,5);
elseif numberIn == '6' 
    numberOut = checkNumber(binIm,6);
elseif numberIn == '7' 
    numberOut = checkNumber(binIm,7);
elseif numberIn == '8' 
    numberOut = checkNumber(binIm,8);
elseif numberIn == '9' 
    numberOut = checkNumber(binIm,9);
end
end