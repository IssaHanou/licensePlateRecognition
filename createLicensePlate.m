function licensePlate = createLicensePlate(a,b,c,d,e,f,pos1,pos2)
range = 8;
%If there are less than two stripes, adjust the range and possibly the pos2
if (pos1 > 0)
    pos2 = pos2 + 1;
else 
    if pos2 > 0
        range = 7;
    else 
        range = 6;
    end
end
letterCount = 1;
letters = [b,c,d,e,f];

%Start with the first letter of the license plate
licensePlate = a;
for i=2:range
   current = 0;
   %If the current position is a stripe
   if (i == pos1 || i == pos2)
       current = '-';
   else 
       %Else get the next letter from the array and update the counter
       current = letters(letterCount);
       letterCount = letterCount + 1;
   end
   %Add the current char to the license plate
   licensePlate = strcat(licensePlate,current);
end
end
