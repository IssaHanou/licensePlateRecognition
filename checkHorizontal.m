function letter = checkHorizontal(img)
tol = 20;
[~,ang] = imgradient(img);
%Get parts with an angle of 90, then they're horizontal
out = ((ang >= 90 - tol) & (ang <= 90 + tol)) | ((ang <= -90 + tol) & (ang >= -90 - tol));
a = imclearborder(out);
b = imcomplement(a);
labeled = label(b);
data = measure(out,labeled,{'Perimeter'});
sticks = find(data.perimeter > 15);
%sticks includes straight lines with a perimeter > 15.
if isempty(sticks)
    letter = '1';
else 
    letter = '7';
end
end