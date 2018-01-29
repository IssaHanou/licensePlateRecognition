function chars = getPossibleChars(num)
%0=all edge chars that cause problems
%1=all possible letters
%2=all numbers
%3=all starting numbers
%4=all letter and numbers
%5=bees
%6=f,p
%7=1,7
%8=2,3,8
%9=4,6
%10=allExtraChecks

%66=b, 68=d, 70:72=f:h, 74:76=j:l, 78=n, 80=p, 82:84=r:t, 86=v, 88=x, 90=z
letters = [char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
starts = [char(66),char(72:74),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
nums = char(48:57);
%b,d,s:t,8:9,3:5,1,p,j:l,f,n
probs = [char(66),char(68),char(83:84),char(56:57),char(51:54),char(49),char(80),char(74:76),char(72),char(78)];

%b,d,s,p,r,h
bees = [char(66),char(68),char(83),char(80),char(82),char(72)];
%f,p
fp = [char(70),char(80)];
%1,7
num1 = [char(49),char(55)];
%2,3,8
num2 = [char(50),char(51),char(56)];
%4,6
num3 = [char(52),char(54)];
allExtraChecks = [char(66),char(68),char(82:83),char(72),char(70),char(80),char(49:52),char(54:56)];

if num == 0
    chars = probs;
elseif num == 1
    chars = letters;
elseif num == 2
    chars = nums;
elseif num == 3
    chars = starts;
elseif num == 4
    chars = [nums, letters];
elseif num == 5
    chars = bees;
elseif num == 6
    chars = fp;
elseif num == 7
    chars = num1;
elseif num == 8
    chars = num2;
elseif num == 9
    chars = num3;
elseif num == 10
    chars = allExtraChecks;
end

end