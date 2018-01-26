function licensePlate = createLicensePlate(letterArray,pos1,pos2)
%If any letter was set to -1, the image couldn't be matched and no plate can be formed
possible = true;
for i=1:length(letterArray)
    if letterArray(i) == -1
        possible = false;
        break;
    end
end

%If there are no letters, return emtpy array
if length(letterArray) == 0
    licensePlate = '';
elseif ~possible
    licensePlate = '';
else
    %Start with the first letter of the license plate
    licensePlate = letterArray(1);
    if length(letterArray) > 1
        letterCount = 2;
        for i=2:8
           current = 0;
           %If the current position is a stripe
           if (i == pos1 || i == pos2)
               current = '-';
           else 
               %Else get the next letter from the array and update the counter
               current = letterArray(letterCount);
               letterCount = letterCount + 1;
           end
           %Add the current char to the license plate
           licensePlate = strcat(licensePlate,current);
        end
    end
end
end
