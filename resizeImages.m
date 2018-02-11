function [img1,img2,img3,img4,img5,img6] = resizeImages(img1,img2,img3,img4,img5,img6,width,heigth)
img1 = imresize(img1,[heigth,width]);
img2 = imresize(img2,[heigth,width]);
img3 = imresize(img3,[heigth,width]);
img4 = imresize(img4,[heigth,width]);
img5 = imresize(img5,[heigth,width]);
img6 = imresize(img6,[heigth,width]);
end