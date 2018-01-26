function license = noNumbers(license,pos1,pos2)
nums = getPossibleChars(2);
lets = getPossibleChars(1);
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
if allNums || allLets
    license = '';
end
end