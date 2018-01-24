function binaryImg = toBinary(img, factor)
    img(img > factor) = 0; %Put everything higher than x on grayscale to black
    img(img > 0) = 255; %Put the rest to white
    binaryImg = img&1; %Make binary image
end