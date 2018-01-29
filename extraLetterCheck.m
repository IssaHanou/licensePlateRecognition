function letterOut = extraLetterCheck(letterIn, image)
letterOut = 0;
if letterIn == 'B' || letterIn == 'R' || letterIn == 'S' || letterIn == 'P' || letterIn == 'D' || letterIn == 'H'
    letterOut = detectLetter(image,5,false);
elseif letterIn == 'F' || letterIn == 'P'
    letterOut = detectLetter(image,6,false);
elseif letterIn == '1' || letterIn == '7'
    letterOut = detectLetter(image,7,false);
elseif letterIn == '2' || letterIn == '3' || letterIn == '8'
    letterOut = detectLetter(image,8,false);
elseif letterIn == '4' || letterIn == '6'
    letterOut = detectLetter(image,9,false);
end
end