function [labeledImage,grayImage,binaryImage] = getEdges(image)
filtered = medfilt2(image,[3 3]);       %filter image 
%**********************************
disk = strel('disk',1);
dilatedIm = imdilate(filtered,disk);    %dilated image
erodedIm = imerode(filtered,disk);      %eroded image
diff = imsubtract(dilatedIm,erodedIm);  %subtract eroded from dilated to get the edges only
intensity = mat2gray(diff);             %create intensity image to min and max values
convoluted = conv2(intensity,[1 1;1 1]);%convolute the intensity image
contrast = imadjust(convoluted,[0.5 0.7],[0 1],.1);     %get the contrasts
binaryImage = logical(contrast);            %create the logical image, with only binary values
[labeledImage,labelNums] = label(binaryImage);     %label the image
grayImage = convoluted;
end