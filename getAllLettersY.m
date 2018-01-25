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
        if(array(n+3) > 10)
            if((array(n+3)/array(n+2)) >= 1.3 && (array(n+3)/array(n+2))<=3)
                z=2;
                if figures == 0
                    a = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(1) = array(n+2) * array(n+3);
                    enda = array(n)+array(n+2);
                elseif figures == 1
                    b = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(2) = array(n+2) * array(n+3);
                    endb = array(n)+array(n+2);
                    startb = array(n);
                elseif figures == 2
                    c = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(3) = array(n+2) * array(n+3);
                    endc = array(n)+array(n+2);
                    startc = array(n);
                elseif figures == 3
                    d = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(4) = array(n+2) * array(n+3);
                    endd = array(n)+array(n+2);
                    startd = array(n);
                elseif figures == 4
                    e = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(5) = array(n+2) * array(n+3);
                    ende = array(n)+array(n+2);
                    starte = array(n);
                elseif figures == 5
                    f = imcrop(grayImg, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                    imageSizes(6) = array(n+2) * array(n+3);
                    startf = array(n);
                end
                figures = figures + 1;
                if figures == 6
                    distances = [startb-enda startc-endb startd-endc starte-endd startf-ende];
                    [M,pos1] = max(distances);
                    distances(pos1) = 0;
                    pos1 = pos1 + 1;
                    [M, pos2] = max(distances);
                    pos2 = pos2 + 2;
                    small = min(imageSizes);
                    big = max(imageSizes);
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
