function letterImage = getLetters(labeled, grayIm, binaryIm)
%The thresIm is a logicial image of the labeled image before labelling
%The grayIm is the grayScale image of the labeled image and the thresIm

%Measure the perimeter of every labeled object in labeled
data = measure(labeled,grayIm,{'Perimeter'},[],Inf,0,0);
per = data.perimeter;

%To show the perimeter histogram
figure;
[hist, bin] = diphist(data.perimeter, [1, 500], 500);
stem(bin, hist);       

%Create an empty image of size thresIm (the labeled image befor it was labeled)
letterImage = binaryIm & 0; 
%Get only the labeled object with perimeter within bounds
letters = find(and(per<200,per>20)); 
for i=1:length(letters)
    %Add the object with the right perimeter bound to our new image to be returned.
    letterImage = letterImage | labeled == letters(i); 
end
end