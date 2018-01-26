function license = checkLicensePlate(licensePlate, pos1, pos2)
nums = getPossibleChars(2);
numbers = 0;
if and(pos1==3,pos2==7) || and(pos1==7,pos2==3)
    %Do something
elseif and(pos1==3,pos2==6) || and(pos1==6,pos2==3)
    if contains(nums,licensePlate(1)) && contains(nums,licensePlate(2))
        number1 = 1;
        number2 = 2;
    elseif contains(nums,licensePlate(3)) && contains(nums,licensePlate(4))
        number1 = 4;
        number2 = 5;
    elseif contains(nums,licensePlate(5)) && contains(nums,licensePlate(6))
        number1 = 7;
        number2 = 8;
    end
    for i=1:8
        if i ~= number1 && i~= number2
            if contains(nums,licensePlate(i))
                if licensePlate(i) == '8' || licensePlate(i) == '3'
                    licensePlate(i) = 'B';
                elseif licensePlate(i) == '1'
                    licensePlate(i) = 'T'
                elseif licensePlate(i) == '2'
                    licensePlate(i) = 'Z'
                elseif licensePlate(i) == '5'
                    licensePlate(i) = 'J'
                elseif licensePlate(i) == '9'
                    licensePlate(i) = 'P' %or R
                end
            end
        end
    end
end
license = licensePlate;
end