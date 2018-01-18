function letterImage = getLetters(labeled, grayIm,thresIm)
%Measure the perimeter of every labeled object in labeled
data = measure(labeled,grayIm,{'Perimeter'},[],Inf,0,0);
per = data.perimeter;

%figure;
%[hist, bin] = diphist(data.perimeter, [1, 250], 250);
%stem(bin, hist);       To show the perimeter histogram

%Create an empty image of size thresIm (the labeled image befor it was labeled)
letterImage = thresIm & 0; 
%Get only the labeled object with perimet in bounds
letters = find(per<200 & per > 20); 
for i=1:length(letters)
    %Add the object with the right perimeter bound to our new image to be returned.
    letterImage = letterImage | labeled == letters(i); 
end
end