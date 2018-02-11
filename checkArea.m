function letter = checkArea(img)
%compute static for p and r
%or check the threshold value
data = measure(img,label(img),{'Area'});
areaValue = max(data.area);
%R has bigger area than P
if areaValue > 50
    letter = 'R';
else
    letter = 'P';
end
end