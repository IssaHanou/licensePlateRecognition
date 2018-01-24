function [labeledImage,grayImage,binaryImage] = getEdges(image)
%Perform median filtering, where each output pixel contains the median value 
%  in the 3-by-3 neighborhood around the corresponding pixel in the input image.
filtered = medfilt2(image,[3 3]);
%**********************************
%Creates a disk-shaped structuring element with radius 1
disk = strel('disk',1);

%Create a dilated image from the filtered image
dilatedIm = imdilate(filtered,disk);

%Create an eroded image from the filtered image
erodedIm = imerode(filtered,disk);

%Subtract eroded from dilated to get the edges only
diff = imsubtract(dilatedIm,erodedIm);  

%Create intensity image to min and max values
intensity = mat2gray(diff);

%Convolute the intensity image
convoluted = conv2(intensity,[1 1;1 1]);

%Get the contrasts, such that values between 0.5 and 0.7 map to values
%  between 0 and 1, .1 specifies the shape of the curve describing the 
%  relationship between the values in the convoluted image and the contrast image.
contrast = imadjust(convoluted,[0.5 0.7],[0 1],.1);

%Create the logical image, with only binary values
binaryImage = logical(contrast);    
        
%Label the image
[labeledImage,labelNums] = label(binaryImage);     
grayImage = convoluted;
end