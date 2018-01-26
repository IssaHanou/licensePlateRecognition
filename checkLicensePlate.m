function licensePlate = checkLicensePlate(licensePlate, pos1, pos2)
nums = getPossibleChars(2);
number1 = 0;
number2 = 0;
number3 = 0;
    if and(pos1==3,pos2==7) || and(pos1==7,pos2==3)
        if and(contains(nums,licensePlate(1)), contains(nums,licensePlate(2))) || and(contains(nums,licensePlate(1)), contains(nums,licensePlate(8))) || and(contains(nums,licensePlate(8)), contains(nums,licensePlate(2)))
            number1 = 1;
            number2 = 2;
            number3 = 8;
        elseif and(contains(nums,licensePlate(4)), contains(nums,licensePlate(5))) && and(contains(nums,licensePlate(5)), contains(nums,licensePlate(6))) || and(contains(nums,licensePlate(4)), contains(nums,licensePlate(6)))
            number1 = 4;
            number2 = 5;
            number3 = 6;
        end
        if number1 ~= 0 && number2 ~= 0 && number3 ~= 0
            licensePlate = changeChar(licensePlate,number1,number2,number3);
        end
    elseif and(pos1==3,pos2==6) || and(pos1==6,pos2==3)
        if contains(nums,licensePlate(1)) && contains(nums,licensePlate(2))
            number1 = 1;
            number2 = 2;
        elseif contains(nums,licensePlate(4)) && contains(nums,licensePlate(5))
            number1 = 4;
            number2 = 5;
        elseif contains(nums,licensePlate(7)) && contains(nums,licensePlate(8))
            number1 = 7;
            number2 = 8;
        end
        if number1 ~= 0 && number2 ~= 0
            licensePlate = changeChar(licensePlate, number1, number2, number3);
        end
    end
end