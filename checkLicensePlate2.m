function [licensePlate,number1] = checkLicensePlate2(license, pos1, pos2,img1,img2,img3,img4,img5,img6)
nums = getPossibleChars(2);
number1 = 0;
number2 = 0;
number3 = 0;
if and(pos1==3,pos2==7)
    if and(contains(nums,license(1)), contains(nums,license(2))) || and(contains(nums,license(1)), contains(nums,license(8))) || and(contains(nums,license(8)), contains(nums,license(2)))
        number1 = 1;
        number2 = 2;
        number3 = 8;
    elseif and(contains(nums,license(4)), contains(nums,license(5))) && and(contains(nums,license(5)), contains(nums,license(6))) || and(contains(nums,license(4)), contains(nums,license(6)))
        number1 = 4;
        number2 = 5;
        number3 = 6;
    elseif contains(nums,license(1)) ||  contains(nums,license(2)) || contains(nums,license(8))
        number1 = 1;
        number2 = 2;
        number3 = 8;
    elseif contains(nums,license(4)) || contains(nums,license(5)) || contains(nums,license(6))
        number1 = 4;
        number2 = 5;
        number3 = 6;
    end
elseif and(pos1==2,pos2==6)
    if and(contains(nums,license(1)), contains(nums,license(7))) || and(contains(nums,license(1)), contains(nums,license(8))) || and(contains(nums,license(8)), contains(nums,license(7)))
        number1 = 1;
        number2 = 7;
        number3 = 8;
    elseif and(contains(nums,license(4)), contains(nums,license(5))) && and(contains(nums,license(5)), contains(nums,license(3))) || and(contains(nums,license(4)), contains(nums,license(3)))
        number1 = 3;
        number2 = 4;
        number3 = 5;
    elseif contains(nums,license(1)) || contains(nums,license(7)) || contains(nums,license(8))
        number1 = 1;
        number2 = 7;
        number3 = 8;
    elseif contains(nums,license(3)) || contains(nums,license(4)) || contains(nums,license(5))
        number1 = 3;
        number2 = 4;
        number3 = 5;
    end
elseif and(pos1==3,pos2==6)
    if and(contains(nums,license(1)), contains(nums,license(2)))
        number1 = 1;
        number2 = 2;
        number3 = 0;
    elseif and(contains(nums,license(4)), contains(nums,license(5)))
        number1 = 4;
        number2 = 5;
        number3 = 0;
    elseif and(contains(nums,license(7)), contains(nums,license(8)))
        number1 = 7;
        number2 = 8;
        number3 = 0;
    elseif contains(nums,license(1)) || contains(nums,license(2))
        number1 = 1;
        number2 = 2;
        number3 = 0;
    elseif contains(nums,license(4)) || contains(nums,license(5))
        number1 = 4;
        number2 = 5;
        number3 = 0;
    elseif contains(nums,license(7)) || contains(nums,license(8))
        number1 = 7;
        number2 = 8;
        number3 = 0;
    end
end
%display(number3);
if number1 ~= 0 && number2 ~= 0
    license = changeChar2(license,pos1,pos2,number1,number2,number3,img1,img2,img3,img4,img5,img6);
%     for i=1:length(license)
%         if i == number1 || i == number2 || i == number3
%             im = getIndexedImage(i,img1,img2,img3,img4,img5,img6,pos1,pos2);
%             if im ~= 0
%                 display(license);
%                 license(i) = detectLetter(im,gray,2);
%             end
%         else 
%             im = getIndexedImage(i,img1,img2,img3,img4,img5,img6,pos1,pos2);
%             if im ~= 0
%                 display(license);
%                 license(i) = detectLetter(im,gray,1);
%             end
%         end
%     end
end
licensePlate = license;
end