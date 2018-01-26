function [num1,num2] = getNumbers(licensePlate,pos1,pos2)
nums = getPossibleChars(2);
num1 = 0;
num2 = 0;
indexNum = [];
for i=1:8
    if i ~= pos1 && i ~= pos2
        if contains(nums,licensePlate(i)) == 1
            if i + 1 == pos1 || i + 1 == pos2 || i == 8
                if contains(nums,licensePlate(i-1)) == 1
                    num1 = i-1;
                    num2 = i;
                    return;
                else 
                    indexNum(end+1) = i;
                end
            elseif i - 1 == pos1 || i - 1 == pos2 || i == 1
                %If two number next to each other are found, return those
                if contains(nums,licensePlate(i+1)) == 1 
                    num1 = i;
                    num2 = i+1;
                    return;
                else 
                    indexNum(end+1) = i;
                end  
            end
        end
    end
end
%If there is only one number found, return that index, and whether the
%next or previous should be a number, if it's next num2 = -1, if it's
%the previous, num1 = -1;
length(indexNum)
if length(indexNum) == 1
   if  indexNum(1) + 1 == pos1 || indexNum(1) + 1 == pos2
        num1 = -1;
        num2 = indexNum(1);
   elseif indexNum(1) - 1 == pos1 || indexNum(1) - 1 == pos2
        num1 = indexNum(1);
        num2 = -1;       
   end
end

end