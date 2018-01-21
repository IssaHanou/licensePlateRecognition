function [a,b,c,d,e,f] = getAllLetters(grayImg);
img2 = grayImg;
for x=85:5:160 % Value x differs per image
    figures = 0;
    img = grayImg;
    img(img > x) = 0; %Put everything higher than x on grayscale to black
    img(img > 0) = 255; %Put the rest to white
    b = img&1; %Make binary image
    st = regionprops(b, 'Area', 'BoundingBox'); 
    array = [st.BoundingBox]; %Get an array of all bounding boxes
    for n=1:4:length(array) %Go through the array, but skip 4 as each 4 numbers are the corners of the bounding box
        if(array(n+3) > 10)
            if((array(n+3)/array(n+2)) >= 1.3 && (array(n+3)/array(n+2))<=3)
                z=2;
                if figures == 0
                a = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                elseif figures == 1
                b = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                elseif figures == 2
                c = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                elseif figures == 3
                d = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                elseif figures == 4
                e = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                elseif figures == 5
                f = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                end
                figures = figures + 1;
                if figures == 6
                break;
                end
            end
        end
    end
    if figures == 6
        break;
    end
end
end