%function [img1, img2, img3, img4, img5, img6, pos1, pos2] = getLetters(img, sizes, alphabet)
function license = getLetters(img, sizes, alphabet)

%Set default
img1 = 0;
img2 = 0;
img3 = 0;
img4 = 0;
img5 = 0;
img6 = 0;
pos1 = 0;
pos2 = 0;
letters = zeros(6,1);

%Make grayscale image
img = rgb2gray(img);

%Make binary image
bw = imbinarize(img,'adaptive','ForegroundPolarity','dark','Sensitivity',0.5);

%Inverse binary image
bw = imcomplement(bw);

%Get all areas
st = regionprops(bw, 'Area', 'BoundingBox'); 
areas = [st.Area]; %Into array
current = 1;
endAt = 0;
%%%%%%%%%%Skip this, just take first 6 bounding boxes bigger than thres (ratio of
%the picture size)
while current ~= 7 && endAt ~= 15
    [~,n] = max( areas ); %Get the biggest area
    areas(n) = 0; %Set 0 for that position so we can get the second biggest area next time
    array = [st.BoundingBox]; %Get the coordinates of that area
    begin = n + (3*(n-1));
    z = 0;
    %If scale is ok, crop the image
    if (array(begin+3)/array(begin+2)) > 1 & (array(begin+3)/array(begin+2)) < 4 && array(begin+3) > 10
        rect = [array(begin)+z array(begin+1)+z array(begin+2)+z array(begin+3)+z];
        %Save these coordinates
        xcoor(current) = array(begin);
        ycoor(current) = array(begin+1);
        ending(current) = array(begin) + array(begin+2);
        width(current) = array(begin+2);
        height(current) = array(begin+3);
        previous = array(begin);
        current = current + 1;
    end
    endAt = endAt + 1;
end
if endAt ~= 15
    %Get the images in the right order
    prevpos = 0;
    for p=1:6
        [~,k] = min(xcoor);
        if prevpos > 0
            prev = ending(prevpos);
        end
        if p == 1
            img1 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            img1 = imresize(img1, sizes);
            letters(1) = detectChar(img1, alphabet, 1);
        elseif p == 2
            img2 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            img2 = imresize(img2, sizes);
            letters(2) = detectChar(img2, alphabet, 1);
            dist(1) = xcoor(k) - prev;
        elseif p == 3
            img3 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            img3 = imresize(img3, sizes);
            letters(3) = detectChar(img3, alphabet, 1);
            dist(2) = xcoor(k) - prev;
        elseif p == 4
            img4 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            img4 = imresize(img4, sizes);
            letters(4) = detectChar(img4, alphabet, 1);
            dist(3) = xcoor(k) - prev;
        elseif p == 5
            img5 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            img5 = imresize(img5, sizes);
            letters(5) = detectChar(img5, alphabet, 1);
            dist(4) = xcoor(k) - prev;
        elseif p == 6
            img6 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            img6 = imresize(img6, sizes);
            letters(6) = detectChar(img6, alphabet, 1);
            dist(5) = xcoor(k) - prev;
        end
        xcoor(k) = intmax;
        prevpos = k;
    end

    %Get the positions of the stripes
    [~,temp1] = max(dist);
    dist(temp1) = 0;
    [~,temp2] = max(dist);
    if temp1 > temp2
        pos1 = temp2+1;
        pos2 = temp1+2;
    else
        pos1 = temp1+1;
        pos2 = temp2+2;
    end

    %Make sure pos1 < pos2
    if pos1 > pos2
        tmp = pos1;
        pos1 = pos2;
        pos2 = tmp;
    end
end

license = constructLicenseNumLetOrdered(img1,img2,img3,img4,img5,img6,pos1,pos2,letters,alphabet);
end