function letter = checkVertical(img)
tol = 8;
[~,ang] = imgradient(img);
out = (ang >= 180 - tol | ang <= -180 + tol);
labeled = label(out);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 11);
if isempty(sticks)
    letter = '7';
else
    letter = '1';
end
end