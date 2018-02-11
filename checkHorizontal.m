function letter = checkHorizontal(img)
tol = 10;
[~,ang] = imgradient(img);
%Get parts with an angle of 90, then they're horizontal
out = ((ang >= 90 - tol) & (ang <= 90 + tol)) | ((ang <= -90 + tol) & (ang >= -90 - tol));
a = imclearborder(out);
b = a == 1;
labeled = label(b);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 15);
%sticks includes straight lines with a perimeter > 15.
%if the y of that stick is in the upper part of the picture it's a 7 else
%it's a 2. 3 has no horizontal sticks
if isemtpy(sticks)
    letter = '3';
elseif length(sticks) == 1
    [y,~] = size(labeled(sticks));
    if y > 40
        letter = '7';
    else
        letter = '2';
    end
end
end