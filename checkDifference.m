function letter = checkDifference(img, alphabet, num)
if num == 1
    %Only numbers
    chars = [char(48:57)];
elseif num == 2
    %Only possible dutch letters
    chars = [char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
end

img = imbinarize(img);

data = measure(img,label(img),{'Perimeter','Size'});
[dataPer,index] = max(data.perimeter);
dataSize = data.size(index);
diff = dataPer/dataSize;

diffArray = zeros(length(chars),1);
for i=1:length(chars)
    diffArray(i) = sum(abs(diff - alphabet(i)));
end

%Return the letter with the minimal difference to the current image
[~,index] = min(diffArray);
letter = chars(index);
end