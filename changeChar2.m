function licensePlate = changeChar2(license,pos1,pos2,number1,number2,number3,img1,img2,img3,img4,img5,img6)
nums = getPossibleChars(2);
im = 0;
for i=1:length(license)
    if i == number1 || i == number2 || i == number3
        if ~contains(nums,license(i))
            im = getIndexedImage(i,img1,img2,img3,img4,img5,img6,pos1,pos2);
            if im ~= 0
                license(i) = detectLetter(im, 2, true);
                letter = license(i);
                if contains(getPossibleChars(10),letter)
                    license(i) = extraLetterCheck(letter,im);
                end
                if license(i) == 'B'
                    license(i) = '8';
                end
            end
        end
    elseif i ~= pos1 || i ~= pos2
        if contains(nums,license(i))
            im = getIndexedImage(i,img1,img2,img3,img4,img5,img6,pos1,pos2);
            if im ~= 0
                license(i) = detectLetter(im, 1 ,true);
                letter = license(i);
                if contains(getPossibleChars(10),letter)
                    license(i) = extraLetterCheck(letter,im);
                end
                if license(i) == '8' || license(i) == '3'
                    license(i) = 'B';
                elseif license(i) == '1' || license(i) == '7'
                    license(i) = 'T'
                end
            end
        end
    end
end
licensePlate = license;
end