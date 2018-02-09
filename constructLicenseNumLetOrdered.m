function license = constructLicenseNumLetOrdered(img1,img2,img3,img4,img5,img6,pos1,pos2,letters,numAlphabet,letAlphabet,width,height)
n1 = 0;
n2 = 0;
n3 = 0;
numbers = [char(48:57)];

if and(pos1==3,pos2==7)
    if and(ismember(letters(1),numbers) == 1,ismember(letters(2),numbers) == 1) || and(ismember(letters(1),numbers) == 1,ismember(letters(6),numbers) == 1) || and(ismember(letters(6),numbers) == 1, ismember(letters(2),numbers) == 1)
        n1 = 1;
        n2 = 2;
        n3 = 6;
    elseif and(ismember(letters(3),numbers) == 1,ismember(letters(4),numbers) == 1) || and(ismember(letters(3),numbers) == 1,ismember(letters(5),numbers) == 1) || and(ismember(letters(4),numbers) == 1,ismember(letters(5),numbers) == 1)
        n1 = 3;
        n2 = 4;
        n3 = 5;
    elseif ismember(letters(1),numbers) == 1 || ismember(letters(2),numbers) == 1 || ismember(letters(6),numbers) == 1
        n1 = 1;
        n2 = 2;
        n3 = 6;
    else
        n1 = 3;
        n2 = 4;
        n3 = 5;
    end
    for p=1:6
        if p == 1
            im = img1;
        elseif p == 2
            im = img2;
        elseif p == 3
            im = img3;
        elseif p == 4
            im = img4;
        elseif p == 5
            im = img5;
        elseif p == 6
            im = img6;
        end
        if p == n1 || p == n2 || p == n3
            if ismember(letters(p),numbers) == 0
                letters(p) = detectChar(im, numAlphabet, width, height, 2);
            end
        else
            if ismember(letters(p),numbers) == 1
                letters(p) = detectChar(im, letAlphabet, width, height, 3);
            end
        end
    end
    license = [letters(1),letters(2),'-',letters(3),letters(4),letters(5),'-',letters(6)];
elseif and(pos1==3,pos2==6)
    if ismember(letters(1),numbers) == 1 && ismember(letters(2),numbers) == 1
        n1 = 1;
        n2 = 2;
    elseif ismember(letters(5),numbers) == 1 && ismember(letters(6),numbers) == 1
        n1 = 5;
        n2 = 6;
    elseif ismember(letters(1),numbers) == 1 || ismember(letters(2),numbers) == 1
        n1 = 1;
        n2 = 2;
    else
        n1 = 5;
        n2 = 6;
    end
    for p=1:6
        if p == 1
            im = img1;
        elseif p == 2
            im = img2;
        elseif p == 3
            im = img3;
        elseif p == 4
            im = img4;
        elseif p == 5
            im = img5;
        elseif p == 6
            im = img6;
        end
        if p == n1 || p == n2
            if ismember(letters(p),numbers) == 0
                letters(p) = detectChar(im, numAlphabet, width, height, 2);
            end
        else
            if ismember(letters(p),numbers) == 1
                letters(p) = detectChar(im, letAlphabet, width, height, 3);
            end
        end
    end
    license = [letters(1),letters(2),'-',letters(3),letters(4),'-',letters(5),letters(6)];
elseif and(pos1==2,pos2==6)
    if and(ismember(letters(1),numbers) == 1,ismember(letters(5),numbers) == 1) || and(ismember(letters(1),numbers) == 1,ismember(letters(6),numbers) == 1) | and(ismember(letters(6),numbers) == 1, ismember(letters(5),numbers) == 1)
        n1 = 1;
        n2 = 5;
        n3 = 6;
    elseif and(ismember(letters(3),numbers) == 1,ismember(letters(4),numbers) == 1) || and(ismember(letters(3),numbers) == 1,ismember(letters(2),numbers) == 1) | and(ismember(letters(4),numbers) == 1,ismember(letters(2),numbers) == 1)
        n1 = 3;
        n2 = 4;
        n3 = 2;
    elseif ismember(letters(1),numbers) == 1 | ismember(letters(2),numbers) == 1 | ismember(letters(6),numbers) == 1
        n1 = 1;
        n2 = 5;
        n3 = 6;
    else
        n1 = 3;
        n2 = 4;
        n3 = 2;
    end
    for p=1:6
        if p == 1
            im = img1;
        elseif p == 2
            im = img2;
        elseif p == 3
            im = img3;
        elseif p == 4
            im = img4;
        elseif p == 5
            im = img5;
        elseif p == 6
            im = img6;
        end
        if p == n1 || p == n2 || p == n3
            if ismember(letters(p),numbers) == 0
                letters(p) = detectChar(im, numAlphabet, width, height, 2);
            end
        else
            if ismember(letters(p),numbers) == 1
                letters(p) = detectChar(im, letAlphabet, width, height, 3);
            end
        end
    end
    license = [letters(1),'-',letters(2),letters(3),letters(4),'-',letters(5),letters(6)];
end

end