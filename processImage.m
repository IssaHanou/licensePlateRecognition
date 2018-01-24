function processImage
% run('GUI/dipstart.m');
% dipimage;

%Read the input image
image = imread('images/4.jpg');
img = imresize(image,[400 NaN]); %Resize the image (as it is too big)

%Execute getPlate with the image
plate = getPlate(img); 

%Execute getEdges with the image from getPlate
[labelImage,grayImage,binaryImage] = getEdges(plate);

%Execute getCroppedPlate with the plate image and binary image
[grayCrop,coor] = getCroppedPlate(binaryImage, plate);
colorCrop = imcrop(img,coor); 

%Execute rotImage with the cropped image
img = rotImage(grayCrop);
imshow(img);

%Execute getAllLetters with the rotated image
[a,b,c,d,e,f,gray,value,xcoorletters] = getAllLettersY(img);


%Get the position of the stripes in the license plate
[pos1, pos2] = getStripes(img, gray,value, xcoorletters);

x=10;
gray = gray+x;
%1: 0-20 
%2: 40/50 (only 4 letters, (8=B, T=I) OR (T=Y, H=N))
%3: 10 (only 5 letters, 6=A)
%4: 0-50
%5: 10-30
%6: \
%7: 10 (only 4 letters (L=U, T=1)
%8: 30 (onlu 
%9: 40/50 (only 4 letters, (8=B, N=H) OR (8=B, N=M)
%10: 0-30 (only 5 letters, P=F)
%13: 0-30
%14: 0-30 (only 5 letters, L=E)
%15: 0 (only 4 letters, 8=B)
%16: 0-20 (only 5 letters, 0=O)
%17: 0-60

%Get the characters of every letter/number in the license plate
[a,b,c,d,e,f] = getPlateChars(a,b,c,d,e,f,gray);

%Get the license plate string
licensePlate = createLicensePlate(a,b,c,d,e,f,pos1,pos2);

display(licensePlate);
end
