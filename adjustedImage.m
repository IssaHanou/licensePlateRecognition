clc;
close all;
clear all;
%.................................
f=imread('images/4.JPG');
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
imshow(labeledImage)
