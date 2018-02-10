function letter  = checkChar(letter, img, letAlphabet, numAlphabet)
%These tend to have a lot of mix ups
if letter == 'V' || letter == 'X' || letter == 'J' || letter == 'N' || letter == 'L' 
    letter = checkDifference(img, letAlphabet);
end
%This tend to mix up a lot
if letter == '0'
    letter = checkDifference(img, numAlphabet);
end

%These tend to overlap, vertical stripe means 1
if letter == '1' || letter == '7'
    letter = checkVertical(img);
end
%These tend to overlap, check position of horizontal stripe (if any)
if letter == '2' || letter == '5' || letter == '3'
    letter = checkHorizontal(img);
end
%These tend to overlap, check area, R has bigger area
if letter == 'P' || letter == 'R'
    letter = checkArea(img);
end
    
end