function letter = check2_7(image,letter,grayFactor)
image = toBinary(image,grayFactor);
tol = 10;
[~,ang] = imgradient(image);
out = ((ang >= 90 - tol) & (ang <= 90 + tol)) | ((ang <= -90 + tol) & (ang >= -90 - tol));
a = imclearborder(out);
b = a == 1;
labeled = label(b);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 15);
%sticks includes straight lines with a perimeter > 15.
%if the y of that stick is in the upper part of the picture it's a 7 else
%it's a 2
if length(sticks) == 1
    [y,x] = size(labeled(sticks));
    if y > 40
        letter = '7';
    else
        letter = '2';
    end
end
end