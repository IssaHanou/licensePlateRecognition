function chars = getNumProblems(num)
%0=0,6,8,9,3
%1=1,7
%2=2,3,7
%3=
%4=4,6
%5=
%6=6,4
%7=7,9,3
%8=8,6,3,0
%9=9,7,0
%10=b,d,s,h,p,r

if num == 0 %0,9,8,6,3,  7,4,5
    chars = [char(48),char(57),char(56),char(54)];
elseif num == 1 %1,7
    chars = [char(49),char(55)];
elseif num == 2 %2,
    chars = [char(50)];
elseif num == 3 
    chars = [char(51),char(54)];
elseif num == 4 %4,6
    chars = [char(52)];
elseif num == 5
    chars = [char(53)];
elseif num == 6 %6,4
    chars = [char(54)];
elseif num == 7 %7,9,3,2
    chars = [char(55),char(57),char(51),char(50)];
elseif num == 8 %8,3,6,0
    chars = [char(56),char(51),char(54)];
elseif num == 9 
    chars = [char(57),char(55)];
elseif num == 10
    chars = [char(66),char(68),char(83),char(80),char(82),char(72)];
end

end