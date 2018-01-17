function letterImage = getLetters(labeled, grayIm,thresIm)
data = measure(labeled,grayIm,{'Perimeter'},[],Inf,0,0);
per = data.perimeter;
letterImage = thresIm & 0;
letters = find(per<180 & per > 20);
for i=1:length(letters)
    letterImage = letterImage | labeled == letters(i);
end
end