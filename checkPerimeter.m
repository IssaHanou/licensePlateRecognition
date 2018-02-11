function letter = checkPerimeter(img)
%compute static for p and r
%or check the threshold value
img = imbinarize(img);
data = measure(img,label(img),{'Perimeter'});
perValue = max(data.perimeter);
%R has bigger area than P
if perValue > 240
    letter = 'R';
else
    letter = 'P';
end
end