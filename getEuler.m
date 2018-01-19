function letters = getLettersEuler(grayImage, binaryImage)
labelImage = bwlabel(binaryImage);
stats = regionprops(labelImage,'EulerNumber');
euler = find([stats.EulerNumber] == 0);
letters = grayImage & 0;
for i=1:length(euler)
    letters = letters | labelImage == euler(i);
end
end