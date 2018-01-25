%Enter 1 for all (possible) letters, 2 for all numbers, 3 for start
%numbers, 4 for all chars, 5 for all 'B' chars
function chars = getPossibleChars(num)

%66=b, 68=d, 70:72=f:h, 74:78=j:n, 80=p, 82:84=r:t, 86:90=v:z
letters = [char(66),char(68),char(70:72),char(74:78),char(80),char(82:84),char(86:90)];
starts = [char(66),char(72:74),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
nums = char(48:57);
%b,8,s,3
bees = [char(66),char(80),char(83),char(56)];

if num == 1
    chars = letters;
elseif num == 2
    chars = nums;
elseif num == 3
    chars = starts;
elseif num == 4
    chars = [nums, letters];
elseif num == 5
    chars = bees;
end
end