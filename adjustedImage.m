function labeledImage = adjustedImage(image)
f=image;
f=imresize(f,[400 NaN]);                   %%image loading unit
g=rgb2gray(f);
g=medfilt2(g,[3 3]);
%**********************************
conc=strel('disk',1);
gi=imdilate(g,conc);
ge=imerode(g,conc);            %%%% morphological image processing
gdiff=imsubtract(gi,ge);
gdiff=mat2gray(gdiff);
gdiff=conv2(gdiff,[1 1;1 1]);
gdiff=imadjust(gdiff,[0.5 0.7],[0 1],.1);
B=logical(gdiff);
[a1 b1]=size(B);
%imshow(B)
labeledImage = bwlabel(B, 8);
coloredLabels = label2rgb (labeledImage, 'hsv', 'k', 'shuffle');
st = regionprops(labeledImage, 'BoundingBox' )
for k = 1 : length(st)
  thisBB = st(k).BoundingBox;
  rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],...
  'EdgeColor','r','LineWidth',2 )
end
