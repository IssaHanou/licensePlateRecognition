function letter = checkVertical(img)
tol = 8;
[~,ang] = imgradient(img);
%Vertical sticks stand up/down 180 degrees
out = (ang >= 180 - tol | ang <= -180 + tol);
labeled = label(out);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 80);
%7 has no vertical sticks
if isempty(sticks)
    letter = '7';
else
    letter = '1';
end
end