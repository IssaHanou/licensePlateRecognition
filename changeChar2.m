function licensePlate = changeChar2(license,pos1,pos2,number1,number2,number3,img1,img2,img3,img4,img5,img6)
nums = getPossibleChars(2);
im = 0;
for i=1:length(license)
    if i == number1 || i == number2 || i == number3
        if ~contains(nums,license(i))
            if and(pos1==3, pos2==6)
                if i==1
                    im = img1;
                elseif i == 2
                    im = img2;
                elseif i == 4
                    im = img3;
                elseif i == 5
                    im = img4;
                elseif i == 7
                    im = img5;
                elseif i == 8
                    im = img6;
                end
            elseif and(pos1==3, pos2==7)
                if i==1
                    im = img1;
                elseif i == 2
                    im = img2;
                elseif i == 4
                    im = img3;
                elseif i == 5
                    im = img4;
                elseif i == 6
                    im = img5;
                elseif i == 8
                    im = img6;
                end
            elseif and(pos1==2,pos2==6)
                if i==1
                    im = img1;
                elseif i == 3
                    im = img2;
                elseif i == 4
                    im = img3;
                elseif i == 5
                    im = img4;
                elseif i == 7
                    im = img5;
                elseif i == 8
                    im = img6;
                end
            end
            if im ~= 0
                license(i) = detectLetter(im, 2);
            end
        end
    elseif i ~= pos1 || i ~= pos2
        if contains(nums,license(i))
            if and(pos1==3, pos2==6)
                if i==1
                    im = img1;
                elseif i == 2
                    im = img2;
                elseif i == 4
                    im = img3;
                elseif i == 5
                    im = img4;
                elseif i == 7
                    im = img5;
                elseif i == 8
                    im = img6;
                end
            elseif and(pos1==3, pos2==7)
                if i==1
                    im = img1;
                elseif i == 2
                    im = img2;
                elseif i == 4
                    im = img3;
                elseif i == 5
                    im = img4;
                elseif i == 6
                    im = img5;
                elseif i == 8
                    im = img6;
                end
            elseif and(pos1==2,pos2==6)
                if i==1
                    im = img1;
                elseif i == 3
                    im = img2;
                elseif i == 4
                    im = img3;
                elseif i == 5
                    im = img4;
                elseif i == 7
                    im = img5;
                elseif i == 8
                    im = img6;
                end
            end
            if im ~= 0
                license(i) = detectLetter(im, 1);
            end
        end
    end
end
licensePlate = license;
end