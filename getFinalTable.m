function finalTable = getFinalTable(tableData)
%  tableData = [{'XS-NP-23',23,105.3};{'XS-NB-23',25,107.1};{'XS-NP-83',28,109.9};{'XS-NB-23',31,112.0};{'AB-291-T',482,1119.0};{'A8-291-1',492,1291.8}];
% Set n to 1 to get the first license string out of the table
n = 1; 
finalTable = {'',0,0};
[y,~] = size(tableData);
countCars = 1;
while n < y % Go on until the end of the table
    plate1 = tableData{n,1}; % Get license string on position n
    plate2 = tableData{n+1,1}; % Get the license string after it
    countPlates = 1;
    while sum(plate1 ~= plate2) < 3 % If they differ in less than 2 letters, it's ok
        plates(countPlates) = "two";
        plates(countPlates) = string(plate1); % Add the plate to an array
        countPlates = countPlates + 1;
        n = n + 1; % Increase n
        if n == y
            break
        else 
            plate1 = plate2; % Make plate1 plate2
            plate2 = tableData{n+1,1}; % Get the license string after plate2 (or now plate1)
        end
    end
    if countPlates > 1 % If the license string has look alikes
        [unique_strings, ~, string_map]=unique(plates);
        most_common_plate = char(unique_strings(mode(string_map))); % Get the one that occurs the most
    else  % If it does not have any look alikes
        most_common_plate = plate1; % Keep this one
    end
    frameCount = tableData{n,2}; % The position can be n, as n was always part of the plates that were used
    timeStamp = tableData{n,3};
    % Now add them to a table
    if countCars == 1
        finalTable = {most_common_plate, frameCount,timeStamp};
    else
        finalTable = [finalTable; {most_common_plate, frameCount,timeStamp}];
    end
    countCars = countCars + 1;
    n = n + 1;
    clear plates;
end
end