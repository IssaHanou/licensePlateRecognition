function image = getIndexedImage(index,img1,img2,img3,img4,img5,img6,pos1,pos2)
image = 0;
if index == 1
    image = img1;
elseif index == 2
    if pos1 == 3
        image = img2;
    end
elseif index == 3
    if pos1 == 2
        image = img2;
    end
elseif index == 4
    image = img3;
elseif index == 5
    image = img4;
elseif index == 6
    if pos2 == 7
        image = img5;
    end
elseif index == 7
    if pos2 == 6
        image = img5;
    end
elseif index == 8
    image = img6;
end
%12-34-56
%1-234-56
%12-345-6
end