function [img1,img2,img3,img4,img5,img6,factor,value,xcoorletters] = getAllLettersY(grayImage)
%Start with -1 values, they are assigned to images if possible 
img1 = -1;
img2 = -1;
img3 = -1;
img4 = -1;
img5 = -1;
img6 = -1;
value = [];
xcoorletters = [];

%Keep boundingBoxArray with sizes of the images found
imageSizes = [];

%Loop over gray scale values to get clearest character images.
for factor=60:5:160
    figures = 0;
    img = grayImage;
    img(img > factor) = 0; %Put everything higher than x on grayscale to black
    img(img > 0) = 255; %Put the rest to white
    b = img&1; %Make binary image
    st = regionprops(b, 'Area', 'BoundingBox'); 
    boundingBoxArray = [st.BoundingBox]; %Get an boundingBoxArray of all bounding boxes
    z=2;

    %Go through the boundingBoxArray, but skip 4 as each 4 numbers are 
    %the corners of the bounding box
    for n=1:4:length(boundingBoxArray) 
        %If the height of the character is larger than 10
        if(boundingBoxArray(n+3) > 10) 
            %The width/height ratio must be in the right range to be a
            %character on a license plate
            if((boundingBoxArray(n+3)/boundingBoxArray(n+2)) >= 1.3 && (boundingBoxArray(n+3)/boundingBoxArray(n+2))<=3) 
                if figures == 0
                    img1 = imcrop(grayImage, [boundingBoxArray(n)-z boundingBoxArray(n+1)-z boundingBoxArray(n+2)+(2*z) boundingBoxArray(n+3)+(2*z)]);
                    imageSizes(end+1)= boundingBoxArray(n+2) * boundingBoxArray(n+3);
                    value(1) = boundingBoxArray(n);
                    value(2) = boundingBoxArray(n+1);
                    value(3) = boundingBoxArray(n+2);
                    value(4) = boundingBoxArray(n+3);
                    xcoorletters(1) = boundingBoxArray(n);
                elseif figures == 1
                    img2 = imcrop(grayImage, [boundingBoxArray(n)-z boundingBoxArray(n+1)-z boundingBoxArray(n+2)+(2*z) boundingBoxArray(n+3)+(2*z)]);
                    imageSizes(end+1) = boundingBoxArray(n+2) * boundingBoxArray(n+3);
                    xcoorletters(2) = boundingBoxArray(n)+(boundingBoxArray(n+2)/2);
                elseif figures == 2
                    img3 = imcrop(grayImage, [boundingBoxArray(n)-z boundingBoxArray(n+1)-z boundingBoxArray(n+2)+(2*z) boundingBoxArray(n+3)+(2*z)]);
                    imageSizes(end+1) = boundingBoxArray(n+2) * boundingBoxArray(n+3);
                    xcoorletters(3) = boundingBoxArray(n)+(boundingBoxArray(n+2)/2);
                elseif figures == 3
                    img4 = imcrop(grayImage, [boundingBoxArray(n)-z boundingBoxArray(n+1)-z boundingBoxArray(n+2)+(2*z) boundingBoxArray(n+3)+(2*z)]);
                    imageSizes(end+1) = boundingBoxArray(n+2) * boundingBoxArray(n+3);
                    xcoorletters(4) = boundingBoxArray(n)+(boundingBoxArray(n+2)/2);
                elseif figures == 4
                    img5 = imcrop(grayImage, [boundingBoxArray(n)-z boundingBoxArray(n+1)-z boundingBoxArray(n+2)+(2*z) boundingBoxArray(n+3)+(2*z)]);
                    imageSizes(end+1) = boundingBoxArray(n+2) * boundingBoxArray(n+3);
                    xcoorletters(5) = boundingBoxArray(n)+(boundingBoxArray(n+2)/2);
                elseif figures == 5
                    img6 = imcrop(grayImage, [boundingBoxArray(n)-z boundingBoxArray(n+1)-z boundingBoxArray(n+2)+(2*z) boundingBoxArray(n+3)+(2*z)]);
                    imageSizes(end+1) = boundingBoxArray(n+2) * boundingBoxArray(n+3);
                    value(5) = boundingBoxArray(n);
                    xcoorletters(6) = boundingBoxArray(n)+(boundingBoxArray(n+2));
                end
                figures = figures + 1;
                %If there are mismatching images, try again
                if figures == 6
                    small = min(imageSizes);
                    big = max(imageSizes);
                    if (big/small < 1.5)
                        return;
                    else
                        figures = 0;
                    end
                end
            end
        end
    end
    if figures == 6
        return;
    end
%end
if length(value) < 5
    value = [];
end
end