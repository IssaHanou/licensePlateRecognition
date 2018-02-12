function [img1, img2, img3, img4, img5, img6, pos1, pos2] = getLetters(img)
%Set default
img1 = 0;
img2 = 0;
img3 = 0;
img4 = 0;
img5 = 0;
img6 = 0;
pos1 = 0;
pos2 = 0;

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
while current ~= 7 && endAt ~= 15
    [~,n] = max( areas ); %Get the biggest area
    areas(n) = 0; %Set 0 for that position so we can get the second biggest area next time
    array = [st.BoundingBox]; %Get the coordinates of that area
    begin = n + (3*(n-1));
    z = 0;
    %If scale is ok, crop the image
    if (array(begin+3)/array(begin+2)) > 1 & (array(begin+3)/array(begin+2)) < 4
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
        elseif p == 2
            img2 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            dist(1) = xcoor(k) - prev;
        elseif p == 3
            img3 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            dist(2) = xcoor(k) - prev;
        elseif p == 4
            img4 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            dist(3) = xcoor(k) - prev;
        elseif p == 5
            img5 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
            dist(4) = xcoor(k) - prev;
        elseif p == 6
            img6 = imcrop(img, [xcoor(k) ycoor(k) width(k) height(k)]);
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

end