function licensePlateString = checkTriples(licensePlateString)
noStripes = erase(licensePlateString,'-');  
arrayLicense = [];
for i=1:6
    arrayLicense(end+1) = licensePlateString(i);
end
uniques = unique(arrayLicense);
count = hist(arrayLicense,uniques)

for i=1:length(count)
    if count(i) > 2
        licensePlateString = '';
        return;
    end
end
end