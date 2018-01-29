function [licensePlate,number1] = checkLicensePlate2(licensePlate, pos1, pos2,img1,img2,img3,img4,img5,img6,gray)
nums = getPossibleChars(2);
number1 = 0;
number2 = 0;
number3 = 0;
oneNumber = detectOneNumber(licensePlate);
if and(pos1==3,pos2==7)
    if and(contains(nums,licensePlate(1)), contains(nums,licensePlate(2))) || and(contains(nums,licensePlate(1)), contains(nums,licensePlate(8))) || and(contains(nums,licensePlate(8)), contains(nums,licensePlate(2)))
        number1 = 1;
        number2 = 2;
        number3 = 8;
    elseif and(contains(nums,licensePlate(4)), contains(nums,licensePlate(5))) && and(contains(nums,licensePlate(5)), contains(nums,licensePlate(6))) || and(contains(nums,licensePlate(4)), contains(nums,licensePlate(6)))
        number1 = 4;
        number2 = 5;
        number3 = 6;
    elseif oneNumber > 0
        if oneNumber == 1 || oneNumber == 2 || oneNumber == 8
            licensePlate = changeChar2(licensePlate, pos1, pos2, 1, 2, 8,img1,img2,img3,img4,img5,img6,gray);
        else 
            licensePlate = changeChar2(licensePlate, pos1, pos2, 4, 5, 6,img1,img2,img3,img4,img5,img6,gray);
        end
    end
elseif and(pos1==2,pos2==6)
    if and(contains(nums,licensePlate(1)), contains(nums,licensePlate(7))) || and(contains(nums,licensePlate(1)), contains(nums,licensePlate(8))) || and(contains(nums,licensePlate(8)), contains(nums,licensePlate(7)))
        number1 = 1;
        number2 = 7;
        number3 = 8;
    elseif and(contains(nums,licensePlate(4)), contains(nums,licensePlate(5))) && and(contains(nums,licensePlate(5)), contains(nums,licensePlate(3))) || and(contains(nums,licensePlate(4)), contains(nums,licensePlate(3)))
        number1 = 3;
        number2 = 4;
        number3 = 5;
    elseif oneNumber > 0
        if oneNumber == 1 || oneNumber == 7 || oneNumber == 8
            licensePlate = changeChar2(licensePlate, pos1, pos2, 1, 7, 8,img1,img2,img3,img4,img5,img6,gray);
        else 
            licensePlate = changeChar2(licensePlate, pos1, pos2, 3, 4, 5,img1,img2,img3,img4,img5,img6,gray);
        end    
    end
elseif and(pos1==3,pos2==6)
    if and(contains(nums,licensePlate(1)), contains(nums,licensePlate(2)))
        number1 = 1;
        number2 = 2;
    elseif and(contains(nums,licensePlate(4)), contains(nums,licensePlate(5)))
        number1 = 4;
        number2 = 5;
    elseif and(contains(nums,licensePlate(7)), contains(nums,licensePlate(8)))
        number1 = 7;
        number2 = 8;
    elseif oneNumber > 0
        if oneNumber == 1 || oneNumber == 2 
            licensePlate = changeChar2(licensePlate, pos1, pos2, 1, 2, 0,img1,img2,img3,img4,img5,img6,gray);
        elseif oneNumber == 4 || oneNumber == 5
            licensePlate = changeChar2(licensePlate, pos1, pos2, 4, 5, 0,img1,img2,img3,img4,img5,img6,gray);
        elseif oneNumber == 7 || oneNumber == 8
            licensePlate = changeChar2(licensePlate, pos1, pos2, 7, 8, 0,img1,img2,img3,img4,img5,img6,gray);
        end  
    end
end
if number1 ~= 0 && number2 ~= 0
    licensePlate = changeChar2(licensePlate, pos1, pos2, number1, number2, number3,img1,img2,img3,img4,img5,img6,gray);
end
end