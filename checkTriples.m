function licensePlateString = checkTriples(licensePlateString)
noStripes = erase(licensePlateString,'-');
for i=1:6
    if numel(find(noStripes(i))) > 2
        licensePlateString = '';
        return;
    end
end
end