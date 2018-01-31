function letter = checkB(image,letter,grayFactor)
tol = 8;
[~,ang] = imgradient(image);
out = (ang >= 180 - tol | ang <= -180 + tol);
labeled = label(out);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 11);
if isempty(sticks)
    letter = 'S';
elseif length(sticks) == 2
    [y1,x1] = size(sticks(1));
    [y2,x2] = size(sticks(2));
    if x2 > 20 || y2 > 20
        letter = 'H';
    end
else %possibilities that remain: P, B, D, R, (K)
    %Check for P or R
    letter = checkNumber(toBinary(image,grayFactor));   
end
end