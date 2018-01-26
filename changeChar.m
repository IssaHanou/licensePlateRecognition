function licensePlate = changeChar(licensePlate, number1, number2, number3)
nums = getPossibleChars(2);
letters = getPossibleChars(1);
   for i=1:8
        if i ~= number1 && i~= number2 && i ~= number3
            if contains(nums,licensePlate(i))
                if licensePlate(i) == '8' || licensePlate(i) == '3'
                    licensePlate(i) = 'B';
                elseif licensePlate(i) == '1'
                    licensePlate(i) = 'T';
                elseif licensePlate(i) == '2'
                    licensePlate(i) = 'Z';
                elseif licensePlate(i) == '5'
                    licensePlate(i) = 'J';
                elseif licensePlate(i) == '9'
                    licensePlate(i) = 'P'; %or R
                elseif licensePlate(i) == '0'
                    licensePlate(i) = 'D';
                end
            end
        else
            if contains(letters,licensePlate(i))
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
            end
        end
    end
end