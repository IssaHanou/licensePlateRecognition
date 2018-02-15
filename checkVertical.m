function letter = checkVertical(img,num)
tol = 5;
[~,ang] = imgradient(img);
%Vertical sticks stand up/down 180 degrees
out = (ang >= 180 - tol | ang <= -180 + tol);
labeled = label(out);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 100);
%7 has no vertical sticks
if isempty(sticks)
    if num == 1
        letter = '7';
    else 
        letter = 'V';
    end
else
    if num == 1
        letter = '1';
    else 
        letter = 'J';
    end
end
end