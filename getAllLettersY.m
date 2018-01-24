function [a,b,c,d,e,f,x] = getAllLettersY(grayImg);
img2 = grayImg;
for x=60:5:160 % Value x differs per image
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
                sizea = array(n+2) * array(n+3);
                enda = array(n) + array(n+2);
                elseif figures == 1
                b = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                sizeb = array(n+2) * array(n+3);
                endb = array(n) + array(n+2);
                startb = array(n);
                elseif figures == 2
                c = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                sizec = array(n+2) * array(n+3);
                startc = array(n);
                endc = array(n) + array(n+2);
                elseif figures == 3
                d = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                sized = array(n+2) * array(n+3);
                startd = array(n);
                endd = array(n) + array(n+2);
                elseif figures == 4
                e = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                sizee = array(n+2) * array(n+3);
                starte = array(n);
                ende = array(n) + array(n+2);
                elseif figures == 5
                f = imcrop(img2, [array(n)-z array(n+1)-z array(n+2)+(2*z) array(n+3)+(2*z)]);
                sizef = array(n+2) * array(n+3);
                startf = array(n);
                end
                figures = figures + 1;
                if figures == 6
                sizes = [sizea sizeb sizec sized sizee sizef];
                dist = [startb-enda startc-endb startd-endc starte-endd startf-ende];
                
                small = min(sizes);
                big = max(sizes);
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
end