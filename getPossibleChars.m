function chars = getPossibleChars(num)
%0=all edge chars that cause problems
%1=all possible letters
%2=all numbers
%3=all starting numbers
%4=all letter and numbers

%66=b, 68=d, 70:72=f:h, 74:78=j:n, 80=p, 82:84=r:t, 86:90=v:z
letters = [char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86:90)];
starts = [char(66),char(72:74),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
nums = char(48:57);
probs = [char(66),char(68),char(83),char(56),char(51),char(49),char(84),char(80)];

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
end
end