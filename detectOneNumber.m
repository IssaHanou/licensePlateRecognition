function number = detectOneNumber(license)
%If there is just one number in the license plate return that else, return
%0
nums = getPossibleChars(2);
numberPos = [];
for i=1:length(license)
    if contains(nums,license(i))
        numberPos(end+1) = i;
    end
end
if length(numberPos) == 1
    number = numberPos(1);
else
    number = 0;
end