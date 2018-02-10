function [plateString,plateIm] = processTwoPlates(colorPlate,binaryPlate,colorPlate2,binaryPlate2)
%Rotate the plate to get it horizontal
[colorRot,angle] = rotateImg(colorPlate,binaryPlate);

%Crop the plate after rotation, depending on angle of rotation
plateIm = cropToPlate(colorRot, angle);

%If no image was made, return nothing
if isempty(plateIm)
    plateString = '';
    plateIm = -1;
    return
end

%Crop to get all letters of the plate
[img1, img2, img3, img4, img5, img6, pos1, pos2] = getLetters(plateIm);

%Check if pos are possible stripe positions and if none of the images is
%'0', if everything is good return true, if something is off, return false
checker = checkGetLetters(img1,img2,img3,img4,img5,img6,pos1,pos2);
if checker == false
    plateString = '';
    plateIm = -1;
    return
end

%To make sure all images are compared with same sizes
height = 100;
width = 50;
%Compute the alphabets once
alphabet = getAlphabet(width,height,1);
numAlphabet = getAlphabet(width,height,2);
letAlphabet = getAlphabet(width,height,3);

license1 = createLicensePlate(img1,img2,img3,img4,img5,img6,pos1,pos2,alphabet,numAlphabet,letAlphabet,width,height);

plateString1 = license1;

%%%%%Process the second plate%%%%%

%Rotate the plate to get it horizontal
[colorRot2,angle2] = rotateImg(colorPlate2,binaryPlate2);

%Crop the plate after rotation, depending on angle of rotation
plateIm2 = cropToPlate(colorRot2, angle2);

%If no image was made, return nothing
if isempty(plateIm2)
    plateString = plateString1;
    return
end

%Crop to get all letters of the plate
[img1, img2, img3, img4, img5, img6, pos1, pos2] = getLetters(plateIm2);

%Check if pos are possible stripe positions and if none of the images is
%'0', if everything is good return true, if something is off, return false
checker2 = checkGetLetters(img1,img2,img3,img4,img5,img6,pos1,pos2);
if checker2 == false
    plateString = plateString1;
    return
end

license2 = createLicensePlate(img1,img2,img3,img4,img5,img6,pos1,pos2,alphabet,numAlphabet,letAlphabet,width,height);

plateString2 = license2;

%%%%%Create Final license%%%%%%
plateString = [plateString1; plateString2];
display(plateString);
end