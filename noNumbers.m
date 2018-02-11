function license = noNumbers(license,pos1,pos2)
nums = [char(48:57)];;
lets = [char(66),char(68),char(70:72),char(74:76),char(78),char(80),char(82:84),char(86),char(88),char(90)];
allNums = true;
allLets = true;
for i=1:length(license)
    if i ~= pos1 && i ~= pos2
        if contains(nums,license(i))
            allNums = false;
        elseif contains(lets,license(i))
            allLets = false;
        end
    end
end
if allNums == true || allLets == true
    license = '';
end
end