function [a,b,c,d,e,f,factor,pos1,pos2] = getAllLettersY(grayImg)
a = -1;
b = -1;
c = -1;
d = -1;
e = -1;
f = -1;
pos1 = 0;
pos2 = 0;
imageSizes = [];

for factor=40:10:160 % Value x differs per image
    figures = 0;
    img = grayImg;
    img(img > factor) = 0; %Put everything higher than x on grayscale to black
    img(img > 0) = 255; %Put the rest to white
    b = img&1; %Make binary image
    st = regionprops(b, 'Area', 'BoundingBox'); 
    array = [st.BoundingBox]; %Get an array of all bounding boxes
    for n=1:4:length(array) %Go through the array, but skip 4 as each 4 numbers are the corners of the bounding box
        if(array(n+3) > 10) %Only get the areas which are higher than 10 pixels
            if((array(n+3)/array(n+2)) >= 1.3 && (array(n+3)/array(n+2))<=3) %Check if the dimensions are good
                z=2; %Add 2 pixels to the bounding boxes
                if figures == 0
                    %Crop the image to get the letter
                    a = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    coora = [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)];
                    %Calculate the size of the image
                    imageSizes(1) = array(n+2) * array(n+3);
                    %The x coordinate of the right down corner
                    enda = array(n)+array(n+2);
                elseif figures == 1
                    b = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(2) = array(n+2) * array(n+3);
                    coorb = [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)];
                    endb = array(n)+array(n+2);
                    %The x coordinate of the left down corner
                    startb = array(n);
                elseif figures == 2
                    c = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(3) = array(n+2) * array(n+3);
                    coorc = [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)];
                    endc = array(n)+array(n+2);
                    startc = array(n);
                elseif figures == 3
                    d = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(4) = array(n+2) * array(n+3);
                    coord = [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)];
                    endd = array(n)+array(n+2);
                    startd = array(n);
                elseif figures == 4
                    e = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(5) = array(n+2) * array(n+3);
                    coore = [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)];
                    ende = array(n)+array(n+2);
                    starte = array(n);
                elseif figures == 5
                    f = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(6) = array(n+2) * array(n+3);
                    coorf = [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)];
                    startf = array(n);
                end
                figures = figures + 1;
                if figures == 6 %If it has all 6 icons...
                    %Calculate the distance between the icons
                    dist = [startb-enda startc-endb startd-endc starte-endd startf-ende];
                    %Get the one with the biggest distance to get the
                    %stripe
                    [~,pos1] = max(dist);
                    %The position of the first stripe
                    dist(pos1) = 0;
                    %Now get the second biggest distance to get the second
                    %stripe
                    [~, pos2] = max(dist);
                    %The position of the second stripe
                    if(pos1 < pos2)
                        pos1 = pos1 + 1;
                        pos2 = pos2 + 2;
                    else
                        pos1 = pos1 + 2;
                        pos2 = pos2 + 1;
                    end
                    %Get the smallest icon
                    small = min(imageSizes);
                    %Get the biggest icon
                    big = max(imageSizes);
                    %Check if the smallest and the biggest icon don't
                    %differ too much
                    if (big/small < 1.5)
                        break;
                    else
                        figures = 0;
                    end
                end
            end
        end
    end
    if figures == 6
        break;
    end
end
