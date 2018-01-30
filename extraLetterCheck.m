function letterOut = extraLetterCheck(letterIn, image)
letterOut = 0;
if letterIn == 'B' || letterIn == 'R' || letterIn == 'S' || letterIn == 'P' || letterIn == 'D' || letterIn == 'H'
    letterOut = detectLetter(image,5,false);
elseif letterIn == 'F' || letterIn == 'P'
    letterOut = detectLetter(image,6,false);
elseif letterIn == 'T' || letterIn == 'H' || letterIn == 'J'
    letterOut = detectLetter(image,7);
end
end