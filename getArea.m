function newImage = getArea(image)
%**********************************
line = strel('line',1,0);
erode = imerode(image,line);
%figure;
%[hist, bin] = diphist(erode, [1, 150], 150);
%stem(bin, hist);       
newImage = and(erode < 110, erode > 10);
end