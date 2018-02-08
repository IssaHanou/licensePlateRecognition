function checker = checkGetLetters(img1,img2,img3,img4,img5,img6,pos1,pos2)
checker = false;
%If either one of the images is 0 (wasn't initialized, return false
if img1 == 0 
    return
elseif img2 == 0
    return
elseif img3 == 0
    return
elseif img4 == 0
    return
elseif img5 == 0
    return
elseif img6 == 0
    return
end
%If all images are ~0 the positions must match either one of the three
%possible pairs to return true
if and(pos1==3,pos2==7) || and(pos1==3,pos2==6) || and(pos1==2,pos2==6)
    checker = true;
    return
end
end