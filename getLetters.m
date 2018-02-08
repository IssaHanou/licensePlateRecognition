function [img1, img2, img3, img4, img5, img6] = getLetters(img)
%Set default
img1 = 0;
img2 = 0;
img3 = 0;
img4 = 0;
img5 = 0;
img6 = 0;

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
while current ~= 7
    [~,n] = max( areas ); %Get the biggest area
    areas(n) = 0; %Set 0 for that position so we can get the second biggest area next time
    array = [st.BoundingBox]; %Get the coordinates of that area
    begin = n + (3*(n-1));
    z = 0;
    %If scale is ok, crop the image
    if (array(begin+3)/array(begin+2)) > 1 && (array(begin+3)/array(begin+2)) < 3
        rect = [array(begin)+z array(begin+1)+z array(begin+2)+z array(begin+3)+z];
        %Crop the image to the plate
        if current == 1
            img1 = imcrop(img,rect);
        elseif current ==2
            img2 = imcrop(img,rect);
        elseif current == 3
            img3 = imcrop(img,rect);
        elseif current == 4
            img4 = imcrop(img,rect);
        elseif current == 5
            img5 = imcrop(img,rect);
        elseif current == 6
            img6 = imcrop(img,rect);
        end
        current = current + 1;
    end
end
end