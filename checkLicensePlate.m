function licensePlate = checkLicensePlate(licensePlate, pos1, pos2)
nums = getPossibleChars(2);
number1 = 0;
number2 = 0;
number3 = 0;
    if and(pos1==3,pos2==7)
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
    elseif and(pos1==3,pos2==6) 
        [number1,number2] = getNumbers(licensePlate,pos1,pos2);
        if number1 ~= 0 && number2 ~= 0
            if number1 == -1 
                i = number2 - 1;
                if licensePlate(i) == 'P' || licensePlate(i) == 'R' || licensePlate(i) == 'V'
                    licensePlate(i) = '9';
                elseif licensePlate(i) == 'B'
                    licensePlate(i) = '8';
                elseif licensePlate(i) == 'J'
                    licensePlate(i) = '5';
                elseif licensePlate(i) == 'D'
                    licensePlate(i) = '0';
                elseif licensePlate(i) == 'T'
                    licensePlate(i) = '1';
                end
            elseif number2 == -1
                i = number1 + 1;
                if licensePlate(i) == 'P' || licensePlate(i) == 'R' || licensePlate(i) == 'V'
                    licensePlate(i) = '9';
                elseif licensePlate(i) == 'B'
                    licensePlate(i) = '8';
                elseif licensePlate(i) == 'J'
                    licensePlate(i) = '5';
                elseif licensePlate(i) == 'D'
                    licensePlate(i) = '0';
                elseif licensePlate(i) == 'T'
                    licensePlate(i) = '1';
                end
            else
                licensePlate = changeChar(licensePlate, number1, number2, number3);
            end
        end
    end
end