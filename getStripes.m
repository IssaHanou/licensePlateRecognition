function [pos1, pos2] = getStripes(img,factor,value,xcoorletters)
pos1 = 0;
pos2 = 0;
img(img > factor) = 0; %Put everything higher than x on grayscale to black
img(img > 0) = 255; %Put the rest to white
binaryImg = img&1; %Make binary image
st = regionprops(binaryImg, 'Area', 'BoundingBox'); 
array = [st.BoundingBox];

%If length smaller than 4, there are no boxes
if ~isempty(value) && ~isempty(xcoorletters)
    for n=1:4:length(array)
        if(array(n+1) > (value(2)+value(4)/10*3) && array(n+1)< value(2)+value(4) && array(n)>value(1) && array(n)<value(5) && array(n+2)<(value(3)/2))   
            for(k=2:length(xcoorletters))
                if(array(n) > xcoorletters(1))
                    if(array(n) < xcoorletters(k))
                        if(pos1 == 0)
                            pos1 = k;
                        else
                            pos2 = k;
                        end
                    end
                end
            end
        end
    end
end
end