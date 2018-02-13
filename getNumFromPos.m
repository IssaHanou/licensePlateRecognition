function [n1,n2,n3] = getNumFromPos(pos1,pos2,letters,numbers)
n1 = 0;
n2 = 0;
n3 = 0;

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
elseif and(pos1==2,pos2==6)
    if and(ismember(letters(1),numbers) == 1,ismember(letters(5),numbers) == 1) || and(ismember(letters(1),numbers) == 1,ismember(letters(6),numbers) == 1) || and(ismember(letters(6),numbers) == 1, ismember(letters(5),numbers) == 1)
        n1 = 1;
        n2 = 5;
        n3 = 6;
    elseif and(ismember(letters(3),numbers) == 1,ismember(letters(4),numbers) == 1) || and(ismember(letters(3),numbers) == 1,ismember(letters(2),numbers) == 1) || and(ismember(letters(4),numbers) == 1,ismember(letters(2),numbers) == 1)
        n1 = 3;
        n2 = 4;
        n3 = 2;
    elseif ismember(letters(1),numbers) == 1 || ismember(letters(2),numbers) == 1 || ismember(letters(6),numbers) == 1
        n1 = 1;
        n2 = 5;
        n3 = 6;
    else
        n1 = 3;
        n2 = 4;
        n3 = 2;
    end
end
end