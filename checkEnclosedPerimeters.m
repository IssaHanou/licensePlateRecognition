function letter = checkEnclosedPerimeters(img,letter)
image = imbinarize(img);
data = measure(image,label(image),{'Perimeter'});
%Filter out small captured perimeters (noise)
perim = find(data.perimeter > 30);
if length(perim) == 2
    letter = '0';
end
end

